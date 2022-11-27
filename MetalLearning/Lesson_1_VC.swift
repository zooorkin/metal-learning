//
// Lesson_1_VC.swift
// MetalLearning
//
// Created by zooorkin on 26.11.2022
// Copyright © 2022 zooorkin. All rights reserved.
//

import UIKit
import Metal
import MetalKit

class Lesson_1_VC: UIViewController {
    
    /// GPU
    var device: MTLDevice!
    
    /// Очередь комманд на GPU
    var commandQueue: MTLCommandQueue!

    /// Библиотека шейдеров
    var library: MTLLibrary!
    
    /// Pipeline для рендеринга
    var pipelineState: MTLRenderPipelineState!
    
    /// Массив с вершинами прямоугольника (хранение вершин для CPU)
    let vertexData: [VertexInput] = [VertexInput(position: [-1024, -1024], color: [1, 1, 1, 1]),
                                     VertexInput(position: [1024, -1024], color: [1, 0, 0, 1]),
                                     VertexInput(position: [-1024, 1024], color: [0, 0, 1, 1]),
                                     VertexInput(position: [1024, 1024], color: [0, 1, 0, 1])]
    
    /// Буфер с вершинами (хранение вершин для GPU)
    var vertexBuffer: MTLBuffer!
    
    /// Размер ViewPort'а
    var viewportSize: vector_uint2 = vector_uint2()

    /// Вспомогательный класс из MetalKit. Упрощает интеграцию CAMetalLayer в UIKit
    /// Можно и без него обойтись, но тогда нужно будет больше кода
    var metalView: MTKView {
        view as! MTKView
    }
    
    override func loadView() {
        view = MTKView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Подключение GPU
        device = MTLCreateSystemDefaultDevice()
        
        // Подключение GPU к слою Metal
        metalView.device = device
        
        // Слой будет обращаться к делегату, когда нужно будет обновить контент
        metalView.delegate = self
        
        // По-умолчанию у MTKView это значение false, из-за чего метод draw
        // вызывается ~60 раз в секунду
        // Если установить значение в true, то для обновления слоя нужно будет
        // вручную вызывать метод setNeedsDisplay()
        // metalView.enableSetNeedsDisplay = true
        
        // Подключение библиотеки шейдеров
        library = device.makeDefaultLibrary()!
        let vertexFunction = library.makeFunction(name: "vertex_shader")
        let fragmentFunction = library.makeFunction(name: "fragment_shader")

        // Модель пайплайна для рендеринга
        // [Шаг 1] Обработка вершин вершинным шейдером
        //         – Как изменятся точки объекта для рендеринга (от поворота или перемещения)
        // [Шаг 2] Растеризация (не программируется, это делает сам Metal)
        //         - На каких пикселях будет отрисован примитив
        // [Шаг 3] Обработка пикселей, полученных в растеризации фрагментным шейдером
        //         – Что конкретном будет нарисовано в каждом пикселе
        let pipelineStateDescriptor = MTLRenderPipelineDescriptor()
        pipelineStateDescriptor.vertexFunction = vertexFunction
        pipelineStateDescriptor.fragmentFunction = fragmentFunction
        pipelineStateDescriptor.colorAttachments[0].pixelFormat = .bgra8Unorm
        
        // Создание пайпайна
        pipelineState = try! device.makeRenderPipelineState(descriptor: pipelineStateDescriptor)
        
        // Вычисление размера памяти, необходимого для хранения буфера вершин
        let vertexBufferSize = vertexData.count * MemoryLayout<VertexInput>.size

        // Создание буфера для GPU размера vertexBufferSize + помещение данных из CPU
        vertexBuffer = device.makeBuffer(bytes: vertexData, length: vertexBufferSize, options: [])
        
        // Создание очереди комманд для текущего GPU
        // Нужно создавать 1 раз до начала цикла рендеринга
        commandQueue = device.makeCommandQueue()
        
        // Начальный цвет (без кода с commandBuffer не установится)
        metalView.clearColor = MTLClearColor(red: 1, green: 0, blue: 0, alpha: 1)
    }
}

extension Lesson_1_VC: MTKViewDelegate {

    func mtkView(_ view: MTKView, drawableSizeWillChange size: CGSize) {
        // Логи об изменении размера View
        print("mtkView drawableSizeWillChange = \(size)")

        // Количество пикселей с учётом текущего количества пикселей на point
        let scale = view.contentScaleFactor
        viewportSize = vector_uint2(
            UInt32(scale * size.width),
            UInt32(scale * size.height))
    }
    
    func draw(in view: MTKView) {
        // Логи вызова метода draw. Можно увидеть как часто происходит обновление
        print("draw = \(arc4random())")
        
        let drawable = metalView.currentDrawable!
        let renderPassDescriptor = MTLRenderPassDescriptor()
        renderPassDescriptor.colorAttachments[0].texture = drawable.texture
        
        // MTLLoadAction: действие, которое будет выполненое прикриплением а начале рендеринга для Render Command Encoder
        // - load: GPU сохраняет текущее содержание перед началом рендеринга
        // - clear: GPU записывает значение clearColor в каждый пиксель перед началом рендеринга
        renderPassDescriptor.colorAttachments[0].loadAction = .clear
        // Новый начальный цвет (зелёный)
        let clearColor = MTLClearColor(red: 0.0, green: 0.4, blue: 0.2, alpha: 0)
        renderPassDescriptor.colorAttachments[0].clearColor = clearColor

        // Создание комманды, которая будет выполняться на GPU
        let commandBuffer = commandQueue.makeCommandBuffer()!
        
        // Отрисовка треугольника

        // Команды для GPU создаются не нарямую, а через объекты Command Encoder
        let renderCommandEncoder = commandBuffer.makeRenderCommandEncoder(descriptor: renderPassDescriptor)!
        // Установка области для отрисовки
        // renderCommandEncoder.setViewport(
        //     MTLViewport(originX: 0, originY: 0, width: 512, height: 512, znear: 0, zfar: 1)
        // )
        // Пайплайн, на котором будут обрабатываться команды
        renderCommandEncoder.setRenderPipelineState(pipelineState)
        // Данные которые будет обрабатываться
        renderCommandEncoder.setVertexBuffer(vertexBuffer, offset: 0, index: 0)
        // Размер View Port
        renderCommandEncoder.setVertexBytes(&viewportSize, length: MemoryLayout<vector_uint2>.size, index: 1)
        // Метод (здесь, рисование треугольника)
        renderCommandEncoder.drawPrimitives(type: .triangleStrip, vertexStart: 0, vertexCount: vertexData.count)
        // Устанавливает, что генерация всех команд в буфер через этот Encoder завершена
        renderCommandEncoder.endEncoding()
        
        commandBuffer.present(metalView.currentDrawable!)
        
        // Отправить для выполнения на GPU
        commandBuffer.commit()
    }
}

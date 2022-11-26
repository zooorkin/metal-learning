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
    
    /// Массив с вершинами (хранение вершин для CPU)
    /// - [0] Верхняя вершина (x, y, z)
    /// - [1] Нижняя левая (x, y, z)
    /// - [2] Нижняя правая (x, y, z)
    /// Если первое значение заменить на 0.5, то верх треугольника сдвинется вправо
    let vertexData: [Float] = [0.0, 1.0, 0.0,
                               -1.0, -1.0, 0.0,
                               1.0, -1.0, 0.0]
    
    /// Буфер с вершинами (хранение вершин для GPU)
    var vertexBuffer: MTLBuffer!

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
        let vertexFunction = library.makeFunction(name: "basic_vertex")
        let fragmentFunction = library.makeFunction(name: "basic_fragment")

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
        let vertexBufferSize = vertexData.count * MemoryLayout<SIMD3<Float>>.size
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
    }
    
    func draw(in view: MTKView) {
        // Логи вызова метода draw. Можно увидеть как часто происходит обновление
        print("draw = \(arc4random())")
        
        let drawable = metalView.currentDrawable!
        let renderPassDescriptor = MTLRenderPassDescriptor()
        renderPassDescriptor.colorAttachments[0].texture = drawable.texture
        renderPassDescriptor.colorAttachments[0].loadAction = .clear
        // Новый начальный цвет (зелёный)
        let clearColor = MTLClearColor(red: 0.0, green: 0.4, blue: 0.2, alpha: 1.0)
        renderPassDescriptor.colorAttachments[0].clearColor = clearColor

        // Создание комманды, которая будет выполняться на GPU
        let commandBuffer = commandQueue.makeCommandBuffer()!
        
        // Отрисовка треугольника
        let renderEncoder = commandBuffer.makeRenderCommandEncoder(descriptor: renderPassDescriptor)!
        // Пайплайн, на котором будет рендериться encoder
        renderEncoder.setRenderPipelineState(pipelineState)
        // Данные которые будет обрабатываться
        renderEncoder.setVertexBuffer(vertexBuffer, offset: 0, index: 0)
        // Метод (здесь, рисование треугольника)
        renderEncoder.drawPrimitives(type: .triangle, vertexStart: 0, vertexCount: 3)
        renderEncoder.endEncoding()
        
        commandBuffer.present(metalView.currentDrawable!)
        
        // Отправить для выполнения на GPU
        commandBuffer.commit()
    }
}

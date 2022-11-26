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
    }
}

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
    }
}

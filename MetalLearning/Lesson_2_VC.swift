//
// Lesson_2_VC.swift
// MetalLearning
//
// Created by zooorkin on 27.11.2022
// Copyright © 2022 zooorkin. All rights reserved.
//

import UIKit
import Metal

/// Вычисление суммы двух массивов
class Lesson_2_VC: UIViewController {
    
    /// GPU
    var device: MTLDevice!
    
    /// Очередь комманд на GPU
    var commandQueue: MTLCommandQueue!

    /// Библиотека шейдеров
    var library: MTLLibrary!
    
    /// Пайплайн для вычислений
    var computePipelineState: MTLComputePipelineState!
    
    var bufferA: MTLBuffer!
    var bufferB: MTLBuffer!
    var bufferC: MTLBuffer!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Подключение GPU
        device = MTLCreateSystemDefaultDevice()
        
        // Создание буферов
        let arrayLength = 1024
        let bufferSize = arrayLength * MemoryLayout<Float>.stride
        bufferA = device.makeBuffer(length: bufferSize, options: .storageModeShared)
        bufferB = device.makeBuffer(length: bufferSize, options: .storageModeShared)
        bufferC = device.makeBuffer(length: bufferSize, options: .storageModeShared)
        
        // Инициализация данных
        generateFloatData(buffer: bufferA, length: arrayLength)
        generateFloatData(buffer: bufferB, length: arrayLength)
        
        // Подключение библиотеки шейдеров
        library = device.makeDefaultLibrary()!
        let kernelFunction = library.makeFunction(name: "add_arrays")!

        // Создание пайплайна для вычислений
        computePipelineState = try! device.makeComputePipelineState(function: kernelFunction)
        
        // Создание очереди комманд для текущего GPU
        commandQueue = device.makeCommandQueue()
        
        // Запуск вычислений
        compute(length: arrayLength)

        // Вывод результатов
        printResults(length: arrayLength)
    }

    private func generateFloatData(buffer: MTLBuffer, length: Int) {
        let floatPtr = buffer.contents().bindMemory(to: Float.self, capacity: length)
        for i in 0 ..< length {
            floatPtr[i] = Float(i)
        }
    }

    private func compute(length: Int) {
        let commandBuffer = commandQueue.makeCommandBuffer()!
        
        // Создание Encoder'а команд
        let computeEncoder = commandBuffer.makeComputeCommandEncoder()!
        computeEncoder.setComputePipelineState(computePipelineState)

        computeEncoder.setBuffer(bufferA, offset: 0, index: 0)
        computeEncoder.setBuffer(bufferB, offset: 0, index: 1)
        computeEncoder.setBuffer(bufferC, offset: 0, index: 2)
        
        // Размер решётки, которую нужно обработать
        let grid = MTLSizeMake(length, 1, 1)
        // Максимальное число параллельных потоков
        let threads = min(computePipelineState.maxTotalThreadsPerThreadgroup, length)
        // Размер решётки, которая будет обрабатываться группой потоков
        let threadGroup = MTLSizeMake(threads, 1, 1)
        computeEncoder.dispatchThreadgroups(grid, threadsPerThreadgroup: threadGroup)
        computeEncoder.endEncoding()
        commandBuffer.commit()
        
        // Ожидание завершения команды
        commandBuffer.waitUntilCompleted()
    }
    
    private func printResults(length: Int) {
        let A = bufferA.contents().bindMemory(to: Float.self, capacity: length)
        let B = bufferB.contents().bindMemory(to: Float.self, capacity: length)
        let C = bufferC.contents().bindMemory(to: Float.self, capacity: length)
        for index in 0 ..< length {
            print("\(A[index]) + \(B[index]) = \(C[index])")
        }
    }
}

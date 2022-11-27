//
// EntryPoint.swift
// MetalLearning
//
// Created by zooorkin on 26.11.2022
// Copyright © 2022 zooorkin. All rights reserved.
//

import UIKit

class EntryPoint {
    
    static let shared = EntryPoint()
    
    private init() { }
    
    func entryPoint() -> UIViewController {
        createLesson2()
    }
    
    // MARK: - Lessons
    
    private func createLesson1() -> UIViewController {
        Lesson_1_VC()
    }
    
    private func createLesson2() -> UIViewController {
        Lesson_2_VC()
    }
}

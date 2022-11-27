//
// UIColor+Metal.swift
// MetalLearning
//
// Created by zooorkin on 27.11.2022
// Copyright © 2022 zooorkin. All rights reserved.
//

import UIKit

extension UIColor {
    
    var metal: SIMD4<Float> {
        let components = cgColor.components!
        return SIMD4<Float>(
            Float(components[0]),
            Float(components[1]),
            Float(components[2]),
            Float(components[3]))
    }
}

extension Array where Element == UIColor {
    
    var metal: [SIMD4<Float>] {
        map { $0.metal }
    }
}

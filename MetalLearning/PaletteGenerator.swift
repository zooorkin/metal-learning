//
// PaletteGenerator.swift
// MetalLearning
//
// Created by zooorkin on 27.11.2022
// Copyright © 2022 zooorkin. All rights reserved.
//

import UIKit

struct Color {
    let name: String
    let hex: String

    init(_ name: String, _ hex: String) {
        self.name = name
        self.hex = hex
    }
}

struct Palette {
    let name: String
    let colors: [Color]

    init(_ name: String, _ colors: [Color]) {
        self.name = name
        self.colors = colors
    }
}

final class PaletteGenerator {

    func generate(_ color: Color) {
        print(staticLetColorDef(color))
    }
    
    func generate(_ name: String, _ palettes: [Palette]) {
        let palettesDef = palettes.map { paletteDef($0) }.joined(separator: "\n\n")
        let allPalletesDef = makeEnum(name, palettesDef)
        print(allPalletesDef)
    }
    
    func generate(_ palette: Palette) {
        print(paletteDef(palette))
    }
    
    private func paletteDef(_ palette: Palette) -> String {
        let colorsDef = palette.colors.map { "    " + staticLetColorDef($0) }.joined(separator: "\n")
        let gradients = [
            staticLetDef("gradient5", gradientDef(palette.colors)),
            staticLetDef("gradient4", gradientDef(palette.colors, n: 4)),
            staticLetDef("gradient3", gradientDef(palette.colors, n: 3)),
            staticLetDef("gradient2", gradientDef(palette.colors, n: 2)),
        ]
        let gradientsDef = gradients.joined(separator: "\n")
        let enumDef = makeEnum(palette.name, colorsDef + "\n\n" + gradientsDef)
        return enumDef
    }
    
    private func gradientDef(_ colors: [Color], n: Int) -> String {
        let nColors = [Color](colors[0..<n])
        return gradientDef(nColors)
    }
    
    private func gradientDef(_ colors: [Color]) -> String {
        "[" + colors.map { $0.name.lowerCamelCased }.joined(separator: ", ") + "]"
    }
    
    private func staticLetColorDef(_ color: Color) -> String {
        staticLetDef(color.name, colorLiteralDef(color))
    }
    
    private func makeEnum(_ name: String, _ innerCode: String) -> String {
        "enum \(name.upperCamelCased) {" + "\n" + innerCode + "\n" + "}"
    }
        
    private func staticLetDef(_ name: String, _ code: String) -> String {
        "static let \(name.lowerCamelCased) = \(code)"
    }
    
    private func colorLiteralDef(_ color: Color) -> String {
        let color = UIColor(hex: color.hex)
        let components = color.cgColor.components!
        let red = components[0]
        let green = components[1]
        let blue = components[2]
        return "#colorLiteral(red: \(red), green: \(green), blue: \(blue), alpha: 1)"
    }
}

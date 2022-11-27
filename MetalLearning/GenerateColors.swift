//
// GenerateColors.swift
// MetalLearning
//
// Created by zooorkin on 27.11.2022
// Copyright © 2022 zooorkin. All rights reserved.
//

import Foundation

enum GenerateColors {
    
    static func generate() {
        let generator = PaletteGenerator()
        generator.generate("Colors", GenerateColors.palettes)
    }
    
    static let palettes: [Palette] = [
        
        // https://coolors.co/palette/ef476f-ffd166-06d6a0-118ab2-073b4c
        Palette("Palette 1", [
            Color("Paradise Pink", "EF476F"),
            Color("Orange Yellow Crayola", "FFD166"),
            Color("Caribbean Green", "06D6A0"),
            Color("Blue NCS", "118AB2"),
            Color("Eagle Green", "073B4C")
        ]),
        
        // https://coolors.co/palette/e63946-f1faee-a8dadc-457b9d-1d3557
        Palette("Palette 2", [
            Color("Imperial Red", "E63946"),
            Color("Honeydew", "F1FAEE"),
            Color("Powder Blue", "A8DADC"),
            Color("Celadon Blue", "457B9D"),
            Color("Prussian Blue", "1D3557")
        ]),
        
        // https://coolors.co/palette/ffcdb2-ffb4a2-e5989b-b5838d-6d6875
        Palette("Palette 3", [
            Color("Apricot", "FFCDB2"),
            Color("Melon", "FFB4A2"),
            Color("Pastel Pink", "E5989B"),
            Color("English Lavender", "B5838D"),
            Color("Old Lavender", "6D6875")
        ]),
        
        // https://coolors.co/palette/f72585-7209b7-3a0ca3-4361ee-4cc9f0
        Palette("Palette 4", [
            Color("Flickr Pink", "F72585"),
            Color("Purple", "7209B7"),
            Color("Trypan Blue", "3A0CA3"),
            Color("Ultramarine Blue", "4361EE"),
            Color("Vivid Sky Blue", "4CC9F0")
        ]),
        
        // https://coolors.co/palette/124e78-f0f0c9-f2bb05-d74e09-6e0e0a
        Palette("Palette 5", [
            Color("Indigo Dye", "124E78"),
            Color("Light Goldenrod Yellow", "F0F0C9"),
            Color("Orange Yellow", "F2BB05"),
            Color("Burnt Orange", "D74E09"),
            Color("Blood Red", "6E0E0A")
        ]),
        
        // https://coolors.co/palette/006d77-83c5be-edf6f9-ffddd2-e29578
        Palette("Palette 6", [
            Color("Ming", "006D77"),
            Color("Middle Blue Green", "83C5BE"),
            Color("Alice Blue", "EDF6F9"),
            Color("Unbleached Silk", "FFDDD2"),
            Color("Dark Salmon", "E29578")
        ]),
        
        // https://coolors.co/palette/003049-d62828-f77f00-fcbf49-eae2b7
        Palette("Palette 7", [
            Color("Prussian Blue", "003049"),
            Color("Maximum Red", "D62828"),
            Color("Orange", "F77F00"),
            Color("Maximum Yellow Red", "FCBF49"),
            Color("Lemon Meringue", "EAE2B7")
        ]),
        
        // https://coolors.co/palette/bcf8ec-336699-f564a9-ffdf64-dbbbf5
        Palette("Palette 8", [
            Color("Aero Blue", "BCF8EC"),
            Color("Lapis Lazuli", "336699"),
            Color("Hot Pink", "F564A9"),
            Color("Naples Yellow", "FFDF64"),
            Color("Mauve", "DBBBF5")
        ])
    ]
}

//
// Colors.swift
// MetalLearning
//
// Created by zooorkin on 27.11.2022
// Copyright © 2022 zooorkin. All rights reserved.
//

import UIKit

enum Colors {

    enum Palette1 {
        static let paradisePink = #colorLiteral(red: 0.9372549019607843, green: 0.2784313725490196, blue: 0.43529411764705883, alpha: 1)
        static let orangeYellowCrayola = #colorLiteral(red: 1.0, green: 0.8196078431372549, blue: 0.4, alpha: 1)
        static let caribbeanGreen = #colorLiteral(red: 0.023529411764705882, green: 0.8392156862745098, blue: 0.6274509803921569, alpha: 1)
        static let blueNcs = #colorLiteral(red: 0.06666666666666667, green: 0.5411764705882353, blue: 0.6980392156862745, alpha: 1)
        static let eagleGreen = #colorLiteral(red: 0.027450980392156862, green: 0.23137254901960785, blue: 0.2980392156862745, alpha: 1)
        
        static let gradient5 = [paradisePink, orangeYellowCrayola, caribbeanGreen, blueNcs, eagleGreen]
        static let gradient4 = [paradisePink, orangeYellowCrayola, caribbeanGreen, blueNcs]
        static let gradient3 = [paradisePink, orangeYellowCrayola, caribbeanGreen]
        static let gradient2 = [paradisePink, orangeYellowCrayola]
    }
    
    enum Palette2 {
        static let imperialRed = #colorLiteral(red: 0.9019607843137255, green: 0.2235294117647059, blue: 0.27450980392156865, alpha: 1)
        static let honeydew = #colorLiteral(red: 0.9450980392156862, green: 0.9803921568627451, blue: 0.9333333333333333, alpha: 1)
        static let powderBlue = #colorLiteral(red: 0.6588235294117647, green: 0.8549019607843137, blue: 0.8627450980392157, alpha: 1)
        static let celadonBlue = #colorLiteral(red: 0.27058823529411763, green: 0.4823529411764706, blue: 0.615686274509804, alpha: 1)
        static let prussianBlue = #colorLiteral(red: 0.11372549019607843, green: 0.20784313725490197, blue: 0.3411764705882353, alpha: 1)
        
        static let gradient5 = [imperialRed, honeydew, powderBlue, celadonBlue, prussianBlue]
        static let gradient4 = [imperialRed, honeydew, powderBlue, celadonBlue]
        static let gradient3 = [imperialRed, honeydew, powderBlue]
        static let gradient2 = [imperialRed, honeydew]
    }
    
    enum Palette3 {
        static let apricot = #colorLiteral(red: 1.0, green: 0.803921568627451, blue: 0.6980392156862745, alpha: 1)
        static let melon = #colorLiteral(red: 1.0, green: 0.7058823529411765, blue: 0.6352941176470588, alpha: 1)
        static let pastelPink = #colorLiteral(red: 0.8980392156862745, green: 0.596078431372549, blue: 0.6078431372549019, alpha: 1)
        static let englishLavender = #colorLiteral(red: 0.7098039215686275, green: 0.5137254901960784, blue: 0.5529411764705883, alpha: 1)
        static let oldLavender = #colorLiteral(red: 0.42745098039215684, green: 0.40784313725490196, blue: 0.4588235294117647, alpha: 1)
        
        static let gradient5 = [apricot, melon, pastelPink, englishLavender, oldLavender]
        static let gradient4 = [apricot, melon, pastelPink, englishLavender]
        static let gradient3 = [apricot, melon, pastelPink]
        static let gradient2 = [apricot, melon]
    }
    
    enum Palette4 {
        static let flickrPink = #colorLiteral(red: 0.9686274509803922, green: 0.1450980392156863, blue: 0.5215686274509804, alpha: 1)
        static let purple = #colorLiteral(red: 0.4470588235294118, green: 0.03529411764705882, blue: 0.7176470588235294, alpha: 1)
        static let trypanBlue = #colorLiteral(red: 0.22745098039215686, green: 0.047058823529411764, blue: 0.6392156862745098, alpha: 1)
        static let ultramarineBlue = #colorLiteral(red: 0.2627450980392157, green: 0.3803921568627451, blue: 0.9333333333333333, alpha: 1)
        static let vividSkyBlue = #colorLiteral(red: 0.2980392156862745, green: 0.788235294117647, blue: 0.9411764705882353, alpha: 1)
        
        static let gradient5 = [flickrPink, purple, trypanBlue, ultramarineBlue, vividSkyBlue]
        static let gradient4 = [flickrPink, purple, trypanBlue, ultramarineBlue]
        static let gradient3 = [flickrPink, purple, trypanBlue]
        static let gradient2 = [flickrPink, purple]
    }
    
    enum Palette5 {
        static let indigoDye = #colorLiteral(red: 0.07058823529411765, green: 0.3058823529411765, blue: 0.47058823529411764, alpha: 1)
        static let lightGoldenrodYellow = #colorLiteral(red: 0.9411764705882353, green: 0.9411764705882353, blue: 0.788235294117647, alpha: 1)
        static let orangeYellow = #colorLiteral(red: 0.9490196078431372, green: 0.7333333333333333, blue: 0.0196078431372549, alpha: 1)
        static let burntOrange = #colorLiteral(red: 0.8431372549019608, green: 0.3058823529411765, blue: 0.03529411764705882, alpha: 1)
        static let bloodRed = #colorLiteral(red: 0.43137254901960786, green: 0.054901960784313725, blue: 0.0392156862745098, alpha: 1)
        
        static let gradient5 = [indigoDye, lightGoldenrodYellow, orangeYellow, burntOrange, bloodRed]
        static let gradient4 = [indigoDye, lightGoldenrodYellow, orangeYellow, burntOrange]
        static let gradient3 = [indigoDye, lightGoldenrodYellow, orangeYellow]
        static let gradient2 = [indigoDye, lightGoldenrodYellow]
    }
    
    enum Palette6 {
        static let ming = #colorLiteral(red: 0.0, green: 0.42745098039215684, blue: 0.4666666666666667, alpha: 1)
        static let middleBlueGreen = #colorLiteral(red: 0.5137254901960784, green: 0.7725490196078432, blue: 0.7450980392156863, alpha: 1)
        static let aliceBlue = #colorLiteral(red: 0.9294117647058824, green: 0.9647058823529412, blue: 0.9764705882352941, alpha: 1)
        static let unbleachedSilk = #colorLiteral(red: 1.0, green: 0.8666666666666667, blue: 0.8235294117647058, alpha: 1)
        static let darkSalmon = #colorLiteral(red: 0.8862745098039215, green: 0.5843137254901961, blue: 0.47058823529411764, alpha: 1)
        
        static let gradient5 = [ming, middleBlueGreen, aliceBlue, unbleachedSilk, darkSalmon]
        static let gradient4 = [ming, middleBlueGreen, aliceBlue, unbleachedSilk]
        static let gradient3 = [ming, middleBlueGreen, aliceBlue]
        static let gradient2 = [ming, middleBlueGreen]
    }
    
    enum Palette7 {
        static let prussianBlue = #colorLiteral(red: 0.0, green: 0.18823529411764706, blue: 0.28627450980392155, alpha: 1)
        static let maximumRed = #colorLiteral(red: 0.8392156862745098, green: 0.1568627450980392, blue: 0.1568627450980392, alpha: 1)
        static let orange = #colorLiteral(red: 0.9686274509803922, green: 0.4980392156862745, blue: 0.0, alpha: 1)
        static let maximumYellowRed = #colorLiteral(red: 0.9882352941176471, green: 0.7490196078431373, blue: 0.28627450980392155, alpha: 1)
        static let lemonMeringue = #colorLiteral(red: 0.9176470588235294, green: 0.8862745098039215, blue: 0.7176470588235294, alpha: 1)
        
        static let gradient5 = [prussianBlue, maximumRed, orange, maximumYellowRed, lemonMeringue]
        static let gradient4 = [prussianBlue, maximumRed, orange, maximumYellowRed]
        static let gradient3 = [prussianBlue, maximumRed, orange]
        static let gradient2 = [prussianBlue, maximumRed]
    }
    
    enum Palette8 {
        static let aeroBlue = #colorLiteral(red: 0.7372549019607844, green: 0.9725490196078431, blue: 0.9254901960784314, alpha: 1)
        static let lapisLazuli = #colorLiteral(red: 0.2, green: 0.4, blue: 0.6, alpha: 1)
        static let hotPink = #colorLiteral(red: 0.9607843137254902, green: 0.39215686274509803, blue: 0.6627450980392157, alpha: 1)
        static let naplesYellow = #colorLiteral(red: 1.0, green: 0.8745098039215686, blue: 0.39215686274509803, alpha: 1)
        static let mauve = #colorLiteral(red: 0.8588235294117647, green: 0.7333333333333333, blue: 0.9607843137254902, alpha: 1)
        
        static let gradient5 = [aeroBlue, lapisLazuli, hotPink, naplesYellow, mauve]
        static let gradient4 = [aeroBlue, lapisLazuli, hotPink, naplesYellow]
        static let gradient3 = [aeroBlue, lapisLazuli, hotPink]
        static let gradient2 = [aeroBlue, lapisLazuli]
    }
}

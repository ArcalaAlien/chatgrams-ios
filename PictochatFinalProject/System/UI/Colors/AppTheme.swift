//
//  AppTheme.swift
//  PictochatFinalProject
//
//  Created by 2155097-050 on 2/24/26.
//
import SwiftUI
internal import Combine

final class AppTheme: ObservableObject {
    
    // This is the closest that I can get to
    // a "static class" like in java.
    //
    // Property wrappers can't go on static
    // variables period.
    static let theme: AppTheme = AppTheme()
    
    // Set the default color scheme to light.
    @Published var colorScheme: ColorScheme = .light
    
    // Specify a private initializer to give
    // the class a "static" feel.
    private init() {}
    
    // Declare all the colors
    
    var primary: Color {
        (colorScheme == .dark) ? AppTheme.rgbToColor(r: 91, g: 107, b: 124) :
                                 AppTheme.rgbToColor(r: 91, g: 107, b: 124)
    }
    
    var secondary: Color {
        (colorScheme == .dark) ? AppTheme.rgbToColor(r: 230, g: 238, b: 246) :
                                 AppTheme.rgbToColor(r: 230, g: 238, b: 246)
    }
    
    var background: Color {
        (colorScheme == .dark) ? AppTheme.rgbToColor(r: 244, g: 240, b: 255) :
                                 AppTheme.rgbToColor(r: 244, g: 240, b: 255)
    }
    
    var accentOne: Color {
        (colorScheme == .dark) ? AppTheme.rgbToColor(r: 170, g: 255, b: 160) :
                                 AppTheme.rgbToColor(r: 170, g: 255, b: 160)
    }
    
    var accentTwo: Color {
        (colorScheme == .dark) ? AppTheme.rgbToColor(r: 255, g: 154, b: 100) :
                                 AppTheme.rgbToColor(r: 255, g: 154, b: 100)
    }
    
    var accentThree: Color {
        (colorScheme == .dark) ? AppTheme.rgbToColor(r: 184, g: 255, b: 247) :
                                 AppTheme.rgbToColor(r: 184, g: 255, b: 247)
    }
    
    var accentFour: Color {
        (colorScheme == .dark) ? AppTheme.rgbToColor(r: 255, g: 180, b: 250) :
                                 AppTheme.rgbToColor(r: 255, g: 180, b: 250)
    }
    
    private static func rgbToColor(r: Double, g: Double, b: Double) -> Color {
        let minR = AppTheme.minimize(r),
            minG = AppTheme.minimize(g),
            minB = AppTheme.minimize(b)
        
        return Color(red: minR,
                     green: minG,
                     blue: minB)
    }
    
    private static func minimize(_ number: Double) -> Double {
        if (number > 255) {
            return 1
        }
        
        if (number < 0) {
            return 0
        }
        
        return number / 255.0
    }
}

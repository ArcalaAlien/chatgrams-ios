//
//  DynamicColor.swift
//  PictochatFinalProject
//
//  Created by 2155097-050 on 2/21/26.
//
import SwiftUI

struct DynamicColor: ShapeStyle {
    var color: Color
    var brightness: CGFloat = 0

    private var adjBrightness: Double {
        if (brightness < 0) {
            return 0
        } else if (brightness > 255) {
            return 1
        }
        
        return brightness / 255
    }
    
    func resolve(in environment: EnvironmentValues) -> some ShapeStyle {
        let resolved = color.resolve(in: environment),
            uiColor = UIColor(
                red: CGFloat(resolved.red),
                green: CGFloat(resolved.green),
                blue: CGFloat(resolved.blue),
                alpha: CGFloat(resolved.opacity))
        
        var hue: CGFloat = 0,
            saturation: CGFloat = 0,
            brightness: CGFloat = 0,
            opacity: CGFloat = 1
            
        uiColor.getHue(&hue,
                       saturation: &saturation,
                       brightness: &brightness,
                       alpha: &opacity)
        
        return Color(hue: hue,
                     saturation: saturation,
                     brightness: brightness,
                     opacity: opacity)
    }
    
    func lighten(by: CGFloat) -> DynamicColor {
        var current: CGFloat = brightness
        current += by
        
        if (current > 255) {
            current = 255
        }
        
        return DynamicColor(color: self.color, brightness: current)
    }
    
    func darken(by: CGFloat) -> DynamicColor  {
        var current: CGFloat = brightness
        current -= by
        
        if (current < 0) {
            current = 0
        }
        
        return DynamicColor(color: self.color, brightness: current)
    }
    
    func toColor(in environment: EnvironmentValues) -> Color {
        let resolved = color.resolve(in: environment),
            uiColor = UIColor(
                red: CGFloat(resolved.red),
                green: CGFloat(resolved.green),
                blue: CGFloat(resolved.blue),
                alpha: CGFloat(resolved.opacity))
        
        var hue: CGFloat = 0,
            saturation: CGFloat = 0,
            brightness: CGFloat = 0,
            opacity: CGFloat = 1
            
        uiColor.getHue(&hue,
                       saturation: &saturation,
                       brightness: &brightness,
                       alpha: &opacity)
        
        return Color(hue: hue,
                     saturation: saturation,
                     brightness: brightness,
                     opacity: opacity)
    }
}

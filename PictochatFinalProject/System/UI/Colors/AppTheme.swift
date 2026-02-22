//
//  AppTheme.swift
//  PictochatFinalProject
//
//  Created by 2155097-050 on 2/20/26.
//
import SwiftUI

struct AppTheme {
    let primary: Color,
        secondary: Color,
        background: Color,
        accentOne: Color,
        accentTwo: Color,
        accentThree: Color,
        accentFour: Color
    
    static let light = AppTheme(// Dark Grey
                                primary: Color(red: minimize(91),
                                               green: minimize(107),
                                               blue: minimize(124)),
                                
                                // Mid Grey
                                secondary: Color(red: minimize(230),
                                                 green: minimize(238),
                                                 blue: minimize(246)),
                                // Light Grey
                                background: Color(red: minimize(244),
                                                  green: minimize(250),
                                                  blue: 1),
                                
                                // Green
                                accentOne: Color(red: minimize(170),
                                                 green: 1,
                                                 blue: minimize(160)),
                                
                                // Orange
                                accentTwo: Color(red: 1,
                                                 green: minimize(154),
                                                 blue: minimize(100)),
                                    
                                // Blue
                                accentThree: Color(red: minimize(184),
                                                   green: 1,
                                                   blue: minimize(247)),
                                // Pink
                                accentFour: Color(red: 1,
                                                  green: minimize(180),
                                                  blue: minimize(250)))
    
    static let dark = AppTheme(primary: .white,
                               secondary: .gray,
                               background: .black,
                                
                                // Green
                                accentOne: Color(red: 0,
                                                 green: minimize(180),
                                                 blue: minimize(80)),
                                
                                // Orange
                                accentTwo: Color(red: minimize(200),
                                                 green: minimize(100),
                                                 blue: 0),
                                // Green-cyan
                                accentThree: Color(red: 0,
                                                   green: minimize(189),
                                                   blue: minimize(159)),
                                // Purple
                                accentFour: Color(red: minimize(138),
                                                  green: minimize(43),
                                                  blue: minimize(226)))
    
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

extension EnvironmentValues {
    @Entry var appTheme: AppTheme = .light
}

#Preview {
    @Previewable @Environment(\.appTheme) var appTheme: AppTheme
    
    VStack {
        HStack {
            VStack {
                Text("Background")
                Rectangle()
                    .foregroundStyle(appTheme.background)
            }
        }
        Divider()
        HStack {
            Spacer()
            VStack {
                Text("Primary")
                Rectangle()
                    .cornerRadius(40)
                    .foregroundStyle(appTheme.primary)
            }
            VStack {
                Text("Secondary")
                Rectangle()
                    .cornerRadius(40)
                    .foregroundStyle(appTheme.secondary)
            }
            VStack {
                Text("Accent One")
                Rectangle()
                    .cornerRadius(40)
                    .foregroundStyle(appTheme.accentOne)
            }
            Spacer()
        }
        HStack {
            Spacer()
            VStack {
                Text("Accent Two")
                Rectangle()
                    .cornerRadius(40)
                    .foregroundStyle(appTheme.accentTwo)
            }
            VStack {
                Text("Accent Three")
                Rectangle()
                    .cornerRadius(40)
                    .foregroundStyle(appTheme.accentThree)
            }
            VStack {
                Text("Accent Four")
                Rectangle()
                    .cornerRadius(40)
                    .foregroundStyle(appTheme.accentFour)
            }
            Spacer()
        }
    }
}

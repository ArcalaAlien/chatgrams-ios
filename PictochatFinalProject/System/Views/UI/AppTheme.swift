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
        blinder: Color,
        accentOne: Color,
        accentTwo: Color,
        accentThree: Color,
        accentFour: Color
    
    static let light = AppTheme(primary: .black,
                                secondary: .gray,
                                blinder: .white,
                                
                                // Green
                                accentOne: Color(red: 0,
                                                 green: channelAsDouble(200),
                                                 blue: channelAsDouble(80)),
                                
                                // Orange
                                accentTwo: Color(red: channelAsDouble(230),
                                                 green: channelAsDouble(100),
                                                 blue: 0),
                                // Green-cyan
                                accentThree: Color(red: 0,
                                                   green: channelAsDouble(139),
                                                   blue: channelAsDouble(115)),
                                // Purple
                                accentFour: Color(red: channelAsDouble(138),
                                                  green: channelAsDouble(43),
                                                  blue: channelAsDouble(226)))
    
    static let dark = AppTheme(primary: .white,
                               secondary: .gray,
                               blinder: .black,
                                
                                // Green
                                accentOne: Color(red: 0,
                                                 green: channelAsDouble(180),
                                                 blue: channelAsDouble(80)),
                                
                                // Orange
                                accentTwo: Color(red: channelAsDouble(200),
                                                 green: channelAsDouble(100),
                                                 blue: 0),
                                // Green-cyan
                                accentThree: Color(red: 0,
                                                   green: channelAsDouble(189),
                                                   blue: channelAsDouble(159)),
                                // Purple
                                accentFour: Color(red: channelAsDouble(138),
                                                  green: channelAsDouble(43),
                                                  blue: channelAsDouble(226)))
    
    static func channelAsDouble(_ number: Double) -> Double {
        return number / 255.0
    }
}

extension EnvironmentValues {
    @Entry var appTheme: AppTheme = .light
}

#Preview {
    @Previewable @Environment(\.appTheme) var appTheme: AppTheme
    
    VStack {
        VStack {
            Text("Blinder")
            Rectangle()
                .foregroundStyle(appTheme.blinder)
        }
        HStack {
            Rectangle()
                .foregroundStyle(appTheme.primary)
            Rectangle()
                .foregroundStyle(appTheme.secondary)
            Rectangle()
                .foregroundStyle(appTheme.accentOne)
        }
        HStack {
            Rectangle()
                .foregroundStyle(appTheme.accentTwo)
            Rectangle()
                .foregroundStyle(appTheme.accentThree)
            Rectangle()
                .foregroundStyle(appTheme.accentFour)
        }
    }
}

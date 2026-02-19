//
//  ColorPalette.swift
//  PictochatFinalProject
//
//  Created by Jacob Martin on 2/16/26.
//

import SwiftUI

extension Color {
    static var blinderColor: Color {
        @Environment(\.colorScheme) var colorScheme
        return colorScheme == .dark ? .black : .white
    }
    
    static var appGridBackgroundColor: Color {
        @Environment(\.colorScheme) var colorScheme
        return colorScheme == .dark ? .black : .white
    }
    
    static var appPrimaryColor: Color {
        @Environment(\.colorScheme) var colorScheme
        return colorScheme == .dark ? .white : .black
    }
    
    static var appSecondaryColor: Color {
//        @Environment(\.colorScheme) var colorScheme
//        return colorScheme == .dark ? .white : .gray
        .gray
    }
    
    static var appPrimaryAccent: Color {
        .green
    }
    
    static var appSecondaryAccent: Color {
        .orange
    }
}

#Preview {
    ZStack {
        VStack {
            HStack {
                Rectangle()
                    .fill(Color.blinderColor)
                Rectangle()
                    .fill(Color.appGridBackgroundColor)
                Rectangle()
                    .fill(Color.appPrimaryColor)
            }
            .padding()
            .background(.pink)
            
            HStack {
                Rectangle()
                    .fill(Color.appSecondaryColor)
                Rectangle()
                    .fill(Color.appPrimaryAccent)
                Rectangle()
                    .fill(Color.appSecondaryAccent)
            }
            .padding()
            .background(.teal)
        }
    }
}

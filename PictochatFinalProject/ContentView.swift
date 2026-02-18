//
//  ContentView.swift
//  PictochatFinalProject
//
//  Created by 2155097-050 on 2/4/26.
//

import SwiftUI


struct ContentView: View {
    @StateObject private var appState: AppState = AppState()
    @StateObject private var blinder: Blinder = Blinder()
    
    var body: some View {
        ZStack {
            // If we're not on the logo
            // then we can use the grid background
            if (appState.currentState != .logo) {
                GridBackground()
            }
            
            // The current screen we're looking at
            appState.currentView
                .environmentObject(appState)
                .environmentObject(blinder)
            
            // Blinder shape to
            // transition between screens
            blinder.shape
                .foregroundStyle(Color.blinderColor)
                .opacity(blinder.displaying ? 1 : 0)
        }
    }
}

#Preview {
    ContentView()
}

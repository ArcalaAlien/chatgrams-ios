//
//  ContentView.swift
//  PictochatFinalProject
//
//  Created by Jacob Martin on 2/4/26.
//

import SwiftUI

struct ContentView: View {
    internal var appState: AppState = Environment(\.appState).wrappedValue,
                 bgObserver: GridLineBackgroundObserver = Environment(\.bgObserver).wrappedValue,
                 blinder: Blinder = Environment(\.blinder).wrappedValue,
                 audioEngine: AudioEngine = Environment(\.audioEngine).wrappedValue
                 
    
    var body: some View {
        let background = bgObserver.background

        GeometryReader { geo in
            let frameH = geo.size.height,
                frameW = geo.size.width
            
            // Capturing the main view's size to pass through
            // in appState
            Color.clear.onAppear {
                appState.appFrameSize = geo.size
                bgObserver.changeGradientsFromState(appState.currentState)
            }
            
            ZStack {
                // If we're not on the logo
                // then we can use the grid background
                if (appState.currentState != .logo) {
                    background
                        .bottomCellSize(CGSize(width: frameW * 2, height: frameH * 2))
                        .topShading(bgObserver.topLayerShading)
                        .bottomShading(bgObserver.bottomLayerShading)
                }
                
                // The current screen we're looking at
                let currentView: AnyView = appState.currentView
                
                // Blinder shape to
                // transition between screens
                blinder.shape
                    .foregroundStyle(Color.blinderColor)
                    .opacity(blinder.displaying ? 1 : 0)
            }
        }
    }
}

#Preview {
    ContentView()
}

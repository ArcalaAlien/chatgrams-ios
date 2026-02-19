//
//  ContentView.swift
//  PictochatFinalProject
//
//  Created by Jacob Martin on 2/4/26.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var appState: AppState = AppState()
    @StateObject private var backgroundWatcher: GridLineBackgroundWatcher = GridLineBackgroundWatcher()
    @StateObject private var blinder: Blinder = Blinder()
    @StateObject private var audioPlayer: AudioEngine = AudioEngine(soundPath: .none)
    
    var body: some View {
        let background = backgroundWatcher.background

        GeometryReader { geo in
            // Capturing the main view's size to pass through
            // in appState
            Color.clear.onAppear {
                self.appState.appFrameSize = geo.size
                backgroundWatcher.topLayerShading = .linearGradient(Gradient(colors: [.appPrimaryAccent, .appSecondaryColor]), startPoint: .zero, endPoint: CGPoint(x: geo.size.width, y: geo.size.height))
            }
            
            ZStack {
                // If we're not on the logo
                // then we can use the grid background
                if (appState.currentState != .logo) {
                    background
                        .topShading(backgroundWatcher.topLayerShading)
                        .bottomShading(backgroundWatcher.bottomLayerShading)
                }
                
                // The current screen we're looking at
                appState.currentView
                    .background(Color.clear)
                    .environmentObject(appState)
                    .environmentObject(backgroundWatcher)
                    .environmentObject(blinder)
                    .environmentObject(audioPlayer)
                
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
    @Previewable @StateObject var appState: AppState = AppState()
    @Previewable @StateObject var watcher: GridLineBackgroundWatcher = GridLineBackgroundWatcher()
    @Previewable @StateObject var blinder: Blinder = Blinder()
    @Previewable @StateObject var audioPlayer: AudioEngine = AudioEngine(soundPath: .none)
    
    GeometryReader { geo in
        ZStack {
            ContentView()
                .background(Color.clear)
                .environmentObject(appState)
                .environmentObject(watcher)
                .environmentObject(blinder)
                .environmentObject(audioPlayer)
            //blinder.shape
            //  .opacity(blinder.displaying ? 1 : 0)
        }
    }
}

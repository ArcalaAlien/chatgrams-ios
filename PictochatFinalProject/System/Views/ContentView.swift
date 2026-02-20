//
//  ContentView.swift
//  PictochatFinalProject
//
//  Created by Jacob Martin on 2/4/26.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject internal var appState: AppState
    @EnvironmentObject internal var bgObserver: GridLineBackgroundObserver
    @EnvironmentObject internal var blinder: Blinder
    @EnvironmentObject internal var audioEngine: AudioEngine
    
    var body: some View {
        let background = bgObserver.background

        GeometryReader { geo in
            let frameH = geo.size.height,
                frameW = geo.size.width
            
            // Capturing the main view's size to pass through
            // in appState
            Color.clear.onAppear {
                appState.appFrameSize = geo.size
                bgObserver
                    .changeGradientsFromState(
                        appState,
                        gradientStart: .zero,
                        gradientEnd: CGPoint(x: geo.size.width,
                                             y: geo.size.height))
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
                switch(appState.currentState) {
                    case .logo:
                        LogoView()
                    case .lobby:
                        LobbyView()
                    case .settings:
                        SettingsView()
                    default:
                        LogoView()
                }
                
                // Blinder shape to
                // transition between screens
                //blinder.shape
                  //  .foregroundStyle(Color.blinderColor)
                    //.opacity(blinder.displaying ? 1 : 0)
            }
        }
    }
}

#Preview {
    @Previewable @StateObject var appState: AppState = AppState()
    @Previewable @StateObject var bgObserver: GridLineBackgroundObserver = GridLineBackgroundObserver()
    @Previewable @StateObject var blinder: Blinder = Blinder()
    @Previewable @StateObject var audioEngine: AudioEngine = AudioEngine(soundPath: .none)
    
    ContentView()
        .environmentObject(appState)
        .environmentObject(bgObserver)
        .environmentObject(blinder)
        .environmentObject(audioEngine)
}

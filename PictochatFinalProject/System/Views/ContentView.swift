//
//  ContentView.swift
//  PictochatFinalProject
//
//  Created by Jacob Martin on 2/4/26.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.appTheme) var appTheme: AppTheme
    @EnvironmentObject internal var appState: AppState
    @EnvironmentObject internal var bgObserver: GridLineBackgroundObserver
    @EnvironmentObject internal var blinder: Blinder
    @EnvironmentObject internal var audioEngine: AudioEngine
    
    var body: some View {
        let background = bgObserver.background

        GeometryReader { geo in
            let frameH = geo.size.height,
                frameW = geo.size.width
                        
            ZStack {
                // Capturing the main view's size to pass through
                // in appState
                Color.clear.onAppear {
                    appState.appFrameSize = geo.size
                    bgObserver
                        .changeGradientsFromState(
                            appState,
                            appTheme: appTheme,
                            gradientStart: .zero,
                            gradientEnd: CGPoint(x: geo.size.width,
                                                 y: geo.size.height))
                }
                .onChange(of: appState.state) { _,_ in
                    bgObserver
                        .changeGradientsFromState(
                            appState,
                            appTheme: appTheme,
                            gradientStart: .zero,
                            gradientEnd: CGPoint(x: geo.size.width,
                                                 y: geo.size.height))
                }
                
                // If we're not on the logo
                // then we can use the grid background
                if (appState.state != .logo) {
                    background
                        .bottomCellSize(CGSize(width: frameW * 2, height: frameH * 2))
                        .topShading(bgObserver.topLayerShading)
                        .bottomShading(bgObserver.bottomLayerShading)
                }
                
                // The current screen we're looking at
                switch(appState.state) {
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
                blinder.shape
                    .foregroundStyle(appTheme.blinder)
                    .opacity(blinder.displaying ? 1 : 0)
            }
        }
    }
}

#Preview {
    PreviewContainer() {
        ContentView()
    }
}

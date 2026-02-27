//
//  ContentView.swift
//  PictochatFinalProject
//
//  Created by Jacob Martin on 2/4/26.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var appState: AppState
    @EnvironmentObject private var appTheme: AppTheme
    @EnvironmentObject private var bgObserver: GridLineBackgroundObserver
    @EnvironmentObject private var blinder: Blinder
    @EnvironmentObject private var audioEngine: AudioEngine
    
    init() {
        appState.set(.logo)
    }
    
    var body: some View {
        GeometryReader { geo in
            let frameH = geo.size.height,
                frameW = geo.size.width
                        
            ZStack {
                // Capturing the main view's size to pass through
                // in appState
                Color.clear.onAppear{
                    appState.frameSize = geo.size
                }
                // Here's the very base background
                Rectangle()
                    .foregroundStyle(appTheme.background)
                
                // If we're not on the logo
                // then we can use the grid background
                if (appState.state != .logo) {
                    bgObserver
                        // Change our cell size
//                        .bottomCellSize(CGSize(width: frameW,
//                                               height: frameH))
//                        .topCellSize(CGSize(width: frameW * 4,
//                                            height: frameH * 4))
                        .background // Return the actual grid!
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
                    .foregroundStyle(appTheme.background)
                    .opacity(blinder.displaying ? 1 : 0)
            }
        }
    }
}

#Preview {
    PreviewContainer {
        ContentView()
    }
}

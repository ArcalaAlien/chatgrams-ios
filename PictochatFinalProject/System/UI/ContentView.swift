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
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                // Here's the very base background
                Rectangle()
                    .foregroundStyle(appTheme.background)
                    .onAppear{
                        appState.frameSize = geo.size
                    }
                
                // If we're not on the logo
                // then we can use the grid background
                if (appState.state != .logo) {
                    bgObserver.background
                }
                
                // The current screen we're looking at
                switch(appState.state) {
                    case .logo:
                        LogoView()
                            .environmentObject(appTheme)
                            .environmentObject(appState)
                            .environmentObject(bgObserver)
                            .environmentObject(blinder)
                            .environmentObject(audioEngine)
                    case .lobby:
                        LobbyView()
                            .environmentObject(appTheme)
                            .environmentObject(appState)
                            .environmentObject(bgObserver)
                            .environmentObject(blinder)
                            .environmentObject(audioEngine)
                    case .settings:
                        SettingsView()
                            .environmentObject(appTheme)
                            .environmentObject(appState)
                            .environmentObject(bgObserver)
                            .environmentObject(blinder)
                            .environmentObject(audioEngine)
                    default:
                        LogoView()
                            .environmentObject(appTheme)
                            .environmentObject(appState)
                            .environmentObject(bgObserver)
                            .environmentObject(blinder)
                            .environmentObject(audioEngine)
                }
                
                // Blinder shape to
                // transition between screens
                blinder.shape
                    .foregroundStyle(appTheme.background)
                    .opacity(blinder.displaying ? 1 : 0)
            }
        }.onAppear() {
            appState.set(.logo)
        }
    }
}

#Preview {
    PreviewContainer {
        ContentView()
    }
}

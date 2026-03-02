//
//  PictochatFinalProjectApp.swift
//  PictochatFinalProject
//
//  Created by Jacob Martin on 2/4/26.
//

import SwiftUI

@main
struct PictochatFinalProjectApp: App {
    @StateObject internal var appState: AppState = AppState.shared
    @StateObject internal var appTheme: AppTheme = AppTheme.theme
    @StateObject internal var bgObserver: GridLineBackgroundObserver = GridLineBackgroundObserver()
    @StateObject internal var blinder: Blinder = Blinder()
    @StateObject internal var audioEngine: AudioEngine = AudioEngine()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .environmentObject(appState)
        .environmentObject(appTheme)
        .environmentObject(bgObserver)
        .environmentObject(blinder)
        .environmentObject(audioEngine)
    }
}

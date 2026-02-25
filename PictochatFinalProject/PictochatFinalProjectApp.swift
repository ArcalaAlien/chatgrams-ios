//
//  PictochatFinalProjectApp.swift
//  PictochatFinalProject
//
//  Created by Jacob Martin on 2/4/26.
//

import SwiftUI

@main
struct PictochatFinalProjectApp: App {
    @StateObject static var appState: AppState = AppState.shared
    @StateObject static var appTheme: AppTheme = AppTheme.theme
    @StateObject static var bgObserver: GridLineBackgroundObserver = GridLineBackgroundObserver()
    @StateObject static var blinder: Blinder = Blinder()
    @StateObject static var audioEngine: AudioEngine = AudioEngine(soundPath: .none)
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .environmentObject(PictochatFinalProjectApp.appState)
        .environmentObject(PictochatFinalProjectApp.appTheme)
        .environmentObject(PictochatFinalProjectApp.bgObserver)
        .environmentObject(PictochatFinalProjectApp.blinder)
        .environmentObject(PictochatFinalProjectApp.audioEngine)        
    }
}

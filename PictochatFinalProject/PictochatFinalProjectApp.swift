//
//  PictochatFinalProjectApp.swift
//  PictochatFinalProject
//
//  Created by Jacob Martin on 2/4/26.
//

import SwiftUI

@main
struct PictochatFinalProjectApp: App {
    @StateObject private var appState: AppState = AppState()
    @StateObject private var bgObserver: GridLineBackgroundObserver = GridLineBackgroundObserver()
    @StateObject private var blinder: Blinder = Blinder()
    @StateObject private var audioEngine: AudioEngine = AudioEngine(soundPath: .none)
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(appState)
                .environmentObject(bgObserver)
                .environmentObject(blinder)
                .environmentObject(audioEngine)
        }
    }
}

//
//  SettingsView.swift
//  PictochatFinalProject
//
//  Created by Jacob Martin on 2/5/26.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        Text("Hello!")
    } // end of body
}

#Preview {
    @Previewable @StateObject var appState: AppState = AppState()
    @Previewable @StateObject var bgObserver: GridLineBackgroundObserver = GridLineBackgroundObserver()
    @Previewable @StateObject var blinder: Blinder = Blinder()
    @Previewable @StateObject var audioEngine: AudioEngine = AudioEngine(soundPath: .none)
    
    SettingsView()
        .environmentObject(appState)
        .environmentObject(bgObserver)
        .environmentObject(blinder)
        .environmentObject(audioEngine)
}

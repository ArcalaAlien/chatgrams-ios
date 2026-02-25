//
//  SettingsView.swift
//  PictochatFinalProject
//
//  Created by Jacob Martin on 2/5/26.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject private var appState: AppState
    @EnvironmentObject private var appTheme: AppTheme
    @EnvironmentObject private var bgObserver: GridLineBackgroundObserver
    @EnvironmentObject private var blinder: Blinder
    @EnvironmentObject private var audioEngine: AudioEngine
    
    var body: some View {
        Text("Hello!")
    } // end of body
}

#Preview {
    PreviewContainer() {
        SettingsView()
    }
}

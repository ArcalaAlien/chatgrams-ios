//
//  LobbyView.swift
//  PictochatFinalProject
//
//  Created by Jacob Martin on 2/5/26.
//
import SwiftUI

struct LobbyView: View {    
    @EnvironmentObject private var appState: AppState
    @EnvironmentObject private var appTheme: AppTheme
    @EnvironmentObject private var bgObserver: GridLineBackgroundObserver
    @EnvironmentObject private var blinder: Blinder
    @EnvironmentObject private var audioEngine: AudioEngine
    
    var body: some View {
        GeometryReader { geo in
            Text("Hello!")
        }.task {
            blinder.show()
            
            try? await Task.sleep(for: .seconds(2))
            withAnimation(.easeInOut(duration: 2)) {
                blinder.hide()
            }
        }
    }// End of body
}

#Preview {
    PreviewContainer() {
        LobbyView()
    }
}

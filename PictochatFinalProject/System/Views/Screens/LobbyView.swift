//
//  LobbyView.swift
//  PictochatFinalProject
//
//  Created by Jacob Martin on 2/5/26.
//
import SwiftUI

struct LobbyView: View {
    enum CurrentTab: Int {
        case publicRooms = 0,
        privateRooms,
        createRoom
    }
    
    @Environment(\.appTheme) var appTheme: AppTheme
    @EnvironmentObject internal var appState: AppState
    @EnvironmentObject internal var bgObserver: GridLineBackgroundObserver
    @EnvironmentObject internal var blinder: Blinder
    @EnvironmentObject internal var audioEngine: AudioEngine
    
    
    var body: some View {
        GeometryReader { geo in
            Rectangle()
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

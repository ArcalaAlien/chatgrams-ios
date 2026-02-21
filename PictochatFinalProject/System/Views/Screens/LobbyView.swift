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
    
    @State private var currentTab: CurrentTab = .publicRooms
    
    var body: some View {
        GeometryReader { geo in
            
        }.onAppear() {
            blinder.show()
            
            Timer.scheduledTimer(withTimeInterval: 2, repeats: false) {_ in
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

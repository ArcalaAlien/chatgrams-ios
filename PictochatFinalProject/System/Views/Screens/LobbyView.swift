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
    
    @EnvironmentObject private var appState: AppState
    @EnvironmentObject private var backgroundWatcher: GridLineBackgroundWatcher
    @EnvironmentObject private var blinder: Blinder
    @EnvironmentObject private var audioPlayer: AudioEngine
    
    @State private var currentTab: CurrentTab = .publicRooms
    
    var body: some View {
        GeometryReader { geo in
            
        }
    } // End of body
}

#Preview {
    @Previewable @StateObject var appState: AppState = AppState()
    @Previewable @StateObject var watcher: GridLineBackgroundWatcher = GridLineBackgroundWatcher()
    @Previewable @StateObject var blinder: Blinder = Blinder()
    @Previewable @StateObject var audioPlayer: AudioEngine = AudioEngine(soundPath: .none)
    
    GeometryReader { geo in
        ZStack {
            watcher.background
                .topShading(watcher.topLayerShading)
                .bottomShading(watcher.bottomLayerShading)
            LobbyView()
                .background(Color.clear)
                .environmentObject(appState)
                .environmentObject(watcher)
                .environmentObject(blinder)
                .environmentObject(audioPlayer)
            //blinder.shape
            //  .opacity(blinder.displaying ? 1 : 0)
        }
    }
}

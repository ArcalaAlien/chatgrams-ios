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
    
    @EnvironmentObject internal var appState: AppState
    @EnvironmentObject internal var bgObserver: GridLineBackgroundObserver
    @EnvironmentObject internal var blinder: Blinder
    @EnvironmentObject internal var audioEngine: AudioEngine
    
    @State private var currentTab: CurrentTab = .publicRooms
    
    var body: some View {
        GeometryReader { geo in
            
        }.onAppear() {
            Timer.scheduledTimer(withTimeInterval: 2, repeats: false) {_ in
                blinder.hide()
            }
        }
    }// End of body
}

#Preview {
    @Previewable @StateObject var appState: AppState = AppState()
    @Previewable @StateObject var bgObserver: GridLineBackgroundObserver = GridLineBackgroundObserver()
    @Previewable @StateObject var blinder: Blinder = Blinder()
    @Previewable @StateObject var audioEngine: AudioEngine = AudioEngine(soundPath: .none)
    
    GeometryReader { geo in
        ZStack {
            let frameH: CGFloat = appState.appFrameSize.height,
                frameW: CGFloat = appState.appFrameSize.width,
                frame: CGPoint = CGPoint(x: frameW, y: frameH)
            var bg: GridLineBackground = bgObserver.background
            
            bg
            LobbyView()
                .environmentObject(appState)
                .environmentObject(bgObserver)
                .environmentObject(blinder)
                .environmentObject(audioEngine)
            blinder.shape
                .opacity(blinder.displaying ? 1 : 0)
        }
    }
}

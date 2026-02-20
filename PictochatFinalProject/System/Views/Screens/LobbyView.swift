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
    
    internal var appState: AppState,
                 bgObserver: GridLineBackgroundObserver,
                 blinder: Blinder,
                 audioEngine: AudioEngine
    
    init() {
        appState = Environment(\.appState).wrappedValue
        bgObserver = Environment(\.bgObserver).wrappedValue
        blinder = Environment(\.blinder).wrappedValue
        audioEngine = Environment(\.audioEngine).wrappedValue
    }
    
    @State private var currentTab: CurrentTab = .publicRooms
    
    var body: some View {
        VStack {
            Text("Hello")
        }
    } // End of body
}

#Preview {
    //var bgObserver: GridLineBackgroundObserver = Environment(\.bgWatcher).wrappedValue
    
    GeometryReader { geo in
        ZStack {
            //bgObserver.background
            LobbyView()
            //blinder.shape
            //  .opacity(blinder.displaying ? 1 : 0)
        }
    }
}

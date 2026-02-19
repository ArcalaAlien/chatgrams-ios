//
//  AppState.swift
//  PictochatFinalProject
//
//  Created by Jacob Martin on 2/4/26.
//
import SwiftUI
internal import Combine

class AppState: ObservableObject {
    @EnvironmentObject var watcher: GridLineBackgroundWatcher
    @EnvironmentObject var blinder: Blinder
    
    enum states: Int {
        case logo = 0,
        lobby,
        settings,
        chatting
    }
    
    @Published var appFrameSize: CGSize
    @Published var currentView: AnyView
    @Published var currentState: states
    
    init() {
        appFrameSize = .zero
        currentView = AnyView(LogoView())
        currentState = .logo
    }
    
    func set(_ newState: states) {
        currentState = newState
        switch(currentState) {
            case .logo:
                currentView = AnyView(LogoView())
            case .lobby:
                currentView = AnyView(LobbyView()
                                                .environmentObject(blinder)
                                                .environmentObject(watcher))
            default:
                currentView = AnyView(LogoView())
        } // end of switch
    } // end of update function
}

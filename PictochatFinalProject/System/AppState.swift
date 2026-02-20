//
//  AppState.swift
//  PictochatFinalProject
//
//  Created by Jacob Martin on 2/4/26.
//
import SwiftUI
internal import Combine

class AppState: ObservableObject {
    enum states: Int {
        case logo = 0,
        lobby,
        settings,
        chatting
    }

    @Published var appFrameSize: CGSize
    @Published var currentState: states
    @Published @State var currentView: AnyView
    
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
                currentView = AnyView(LobbyView())
            default:
                currentView = AnyView(LogoView())
        } // end of switch
    } // end of update function
}

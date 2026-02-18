//
//  AppState.swift
//  PictochatFinalProject
//
//  Created by 2155097-050 on 2/4/26.
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
    
    @Published var currentView: AnyView
    @Published var currentState: states
    
    init() {
        currentView = AnyView(LogoView())
        currentState = .logo
    }
    
    func setState(_ newState: states) {
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

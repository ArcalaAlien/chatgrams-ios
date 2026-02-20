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
        lobbyCreation,
        settings,
        chatting
    }
    
    enum subStates: Int {
        case none = -1,
        lobbyPublicTab,
        lobbyPrivateTab
    }

    @Published var appFrameSize: CGSize
    @Published var currentState: states
    @Published var currentSubState: subStates
    
    init() {
        appFrameSize = .zero
        currentState = .logo
        currentSubState = .none
    }
    
    func set(_ newState: states, newSubState: subStates = .none) {
        currentState = newState
        currentSubState = newSubState
    } // end of update function
}

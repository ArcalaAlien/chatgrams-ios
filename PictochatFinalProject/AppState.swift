//
//  AppState.swift
//  PictochatFinalProject
//
//  Created by 2155097-050 on 2/4/26.
//
import SwiftUI
internal import Combine

class AppState: ObservableObject {
    enum validStates: Int {
        case logo = 0,
        lobby,
        settings,
        chatting
    }
    
    @Published var currentState: validStates = .logo
}


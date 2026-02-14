//
//  ContentView.swift
//  PictochatFinalProject
//
//  Created by 2155097-050 on 2/4/26.
//

import SwiftUI


struct ContentView: View {
    @StateObject var appState: AppState = AppState()
    
    init() {
        self.appState.currentState = .logo
    }
    
    var body: some View {
        switch (appState.currentState) {
            case .logo:
                LogoView(currentState: appState.currentState)
            case .lobby:
                LobbyView(currentState: appState.currentState)
            default:
                LogoView(currentState: appState.currentState)
        }
    }
}

#Preview {
    ContentView()
}

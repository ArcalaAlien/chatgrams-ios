//
//  ContentView.swift
//  PictochatFinalProject
//
//  Created by 2155097-050 on 2/4/26.
//

import SwiftUI


struct ContentView: View {
    @StateObject private var appState: AppState = AppState()
    
    init() {
        appState.currentState = .logo
    }
    
    var body: some View {
        switch (appState.currentState) {
            case .logo:
                LogoView().environmentObject(appState)
            case .lobby:
                LobbyView().environmentObject(appState)
            default:
                LogoView().environmentObject(appState)
        }
    }
}

#Preview {
    ContentView()
}

//
//  LobbyView.swift
//  PictochatFinalProject
//
//  Created by 2155097-050 on 2/5/26.
//
import SwiftUI

struct LobbyView: View {
    enum CurrentTab: Int {
        case publicRooms = 0,
        privateRooms,
        createRoom
    }
    
    @State var currentState: AppState.validStates
    @State private var currentTab: CurrentTab = .publicRooms
    
    var body: some View {
        VStack {
            HStack {
                
            }
            
            
        }// End of main VStack
    } // End of body
}

#Preview {
    LobbyView(currentState: .lobby)
}

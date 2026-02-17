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
    
    @State private var currentTab: CurrentTab = .publicRooms
    
    var body: some View {
        GeometryReader { geo in
            let frameH = geo.size.height,
                frameW = geo.size.width
            
            ZStack {
                GridBackground()
                VStack {
                    ZStack {
                        Rectangle()
                            .opacity(0.8)
                            .foregroundStyle(.primary)
                    }.frame(width: frameW * 0.95,
                            height: frameH * 0.8) // End of Lobby Frame ZStack
                    
                    ZStack {
                        Rectangle()
                            .opacity(0.8)
                            .foregroundStyle(.primary)
                        Button("Chat Settings") {
                            
                        }
                        .foregroundStyle(Color.accentColor)
                        .font(.title)// End of button
                    }.frame(width: frameW * 0.6,
                            height: frameH * 0.1) // end of Settings Button ZStack
                }
            }
        }
    } // End of body
}

#Preview {
    

}

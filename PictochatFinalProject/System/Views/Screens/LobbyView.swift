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
    
    @EnvironmentObject var blinder: Blinder
    @State private var currentTab: CurrentTab = .publicRooms
    
    var body: some View {
        GeometryReader { geo in
            let frameH = geo.size.height,
                frameW = geo.size.width
            ZStack {
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
        .onAppear() {
            blinder.show()
            
            Timer.scheduledTimer(withTimeInterval: 1, repeats: false) {_ in
                withAnimation(.easeInOut(duration: 2)) {
                    blinder.hide()
                }
            }
        }
    } // End of body
}

#Preview {
    @Previewable @StateObject var blinder: Blinder = Blinder()
    
    ZStack {
        GridBackground()
        LobbyView()
            .environmentObject(blinder)
        blinder.shape
            .opacity(blinder.displaying ? 1 : 0)
    }
}

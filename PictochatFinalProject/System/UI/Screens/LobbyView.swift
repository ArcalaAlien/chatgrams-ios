//
//  LobbyView.swift
//  PictochatFinalProject
//
//  Created by Jacob Martin on 2/5/26.
//
import SwiftUI

struct LobbyView: View {    
    @EnvironmentObject private var appState: AppState
    @EnvironmentObject private var appTheme: AppTheme
    @EnvironmentObject private var bgObserver: GridLineBackgroundObserver
    @EnvironmentObject private var blinder: Blinder
    @EnvironmentObject private var audioEngine: AudioEngine
    
    var body: some View {
        GeometryReader { geo in
            let frameH = geo.size.height,
                frameW = geo.size.width
            
            ZStack {
                LobbyFrame()
                VStack(alignment: .center, spacing: 5) {
                    AppLogo()
                        .frame(width: frameW / 10,
                                height: frameH / 10)
                        .offset(y: frameH - (frameH / 1.05))
                    Spacer()
                    ScrollView(.vertical, showsIndicators:  false) {
                        PublicChatRoomListBox(iconType: .iconA)
                            .frame(width: frameW / 1.25, height: frameH / 5)
                            .padding(0)
                        PublicChatRoomListBox(iconType: .iconB)
                            .frame(width: frameW / 1.25, height: frameH / 5)
                            .padding(0)
                        PublicChatRoomListBox(iconType: .iconC)
                            .frame(width: frameW / 1.25, height: frameH / 5)
                            .padding(0)
                        PublicChatRoomListBox(iconType: .iconD)
                            .frame(width: frameW / 1.25, height: frameH / 5)
                            .padding(0)
                        PublicChatRoomListBox(iconType: .iconE)
                            .frame(width: frameW / 1.25, height: frameH / 5)
                            .padding(0)
                    }
                }
                .frame(width: frameW / 1.125, height: frameH / 1.3)
                .offset(y: frameH / -10)
            }
        }.task {
            blinder.show()
            bgObserver.changeBackground()
            try? await Task.sleep(for: .seconds(2))
            audioEngine.next()
            audioEngine.loop()
            
            withAnimation(.easeInOut(duration: 2)) {
                blinder.hide()
            }
        }
    }// End of body
}

#Preview {
    PreviewContainer() {
        LobbyView()
    }
}

//
//  StateChanger.swift
//  PictochatFinalProject
//
//  Created by 2155097-050 on 2/20/26.
//
import SwiftUI

                        // This is creating a Content "struct"
                        // that inherits from the view protocol.
struct PreviewContainer<Content: View>: View {
    @Environment(\.appTheme) var appTheme: AppTheme
    @StateObject var appState: AppState = AppState()
    @StateObject var bgObserver: GridLineBackgroundObserver = GridLineBackgroundObserver()
    @StateObject var blinder: Blinder = Blinder()
    @StateObject var audioEngine: AudioEngine = AudioEngine(soundPath: .none)
    
    // We use this to create the nifty
    //
    // PreviewContainer() {
    //      LogoView()
    // }
    //
    // effect without having to actually pass
    // a view through with a parameter.
    @ViewBuilder var content: Content
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                content
                    .environmentObject(appState)
                    .environmentObject(blinder)
                    .environmentObject(bgObserver)
                    .environmentObject(audioEngine)
                createDebugStateChanger()
                    .offset(y: -geo.size.height / 2.25)
            }
        }
    }
    
    private func createDebugStateChanger() -> some View {
        return GeometryReader { geo in
            ZStack {
                Color.clear.onAppear() {
                    appState.appFrameSize = geo.size
                }
                
                HStack(spacing: 5) {
                    Spacer()
                    Button("Prev") {
                        // We shouldn't get here,
                        // but just in case.
                        if (appState.state == .none) {
                            appState.set(.logo)
                        }
                        else {
                            appState.set(appState.state.previous())
                        }
                    }
                        .padding()
                        .background(appTheme.accentThree)
                        .foregroundStyle(appTheme.blinder)
                        .cornerRadius(5)
                    Spacer()
                    Divider()
                    HStack {
                        Spacer()
                        VStack {
                            Text("State: ")
                                .font(.default.italic())
                                .padding(2)
                                .background(appTheme.accentTwo)
                                .cornerRadius(5)
        
                            Text("\(appState.state)")
                                .fontWeight(.semibold)
                                .padding()
                                .background(appTheme.accentFour)
                                .cornerRadius(5)
                        }
                        Spacer()
                        VStack {
                            Text("Substate:")
                                .font(.default.italic())
                                .padding(2)
                                .background(appTheme.accentTwo)
                                .cornerRadius(5)
                            
                            Text("\(appState.subState)")
                                .fontWeight(.semibold)
                                .padding()
                                .background(appTheme.accentFour)
                                .cornerRadius(5)
                        }
                        Spacer()
                    }
                    .background(appTheme.accentOne)
                    Divider()
                    Spacer()
                    Button("Next") {
                        let lastState: AppState.State = .chatting
                        
                        if (appState.state == lastState) {
                            appState.set(lastState)
                        }
                        else {
                            appState.set(appState.state.next())
                        }
                    }
                        .padding()
                        .background(appTheme.accentThree)
                        .foregroundStyle(appTheme.blinder)
                        .cornerRadius(5)
                    Spacer()
                } // End of HStack
                .frame(width: geo.size.width,
                       height: geo.size.height / 8)
                .background(appTheme.accentOne)
            }// end of ZStack
        } // end of GeometryReader
    } // end of createStateHeader function
} // end of Preview extension

#Preview {
    PreviewContainer() {
        LobbyView()
    }
}

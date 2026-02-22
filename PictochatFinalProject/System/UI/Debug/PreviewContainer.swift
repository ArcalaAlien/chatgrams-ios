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
    
    @State var displaying: Bool = true
    
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
            let frameH = geo.size.height,
                frameW = geo.size.width
            
            ZStack {
                content
                ZStack {
                    createDebugStateChanger()
                        .offset(y: displaying ? -frameH / 2.25 : -frameH / 1.7)
                    var debugBlinder = Blinder()
                    debugBlinder.shape
                        .foregroundStyle(appTheme.background)
                        .frame(width: frameW, height: frameH / 4.5)
                        .offset(y: displaying ? -frameH / 2.3 : -frameH / 1.6)
                        .opacity(displaying ? 0 : 1)
                        .onAppear() {
                            debugBlinder = debugBlinder.displaying(displaying)
                        }
                }
            }
            .environmentObject(appState)
            .environmentObject(blinder)
            .environmentObject(bgObserver)
            .environmentObject(audioEngine)
        }
    }
    
    func changeStateTo(_ state: AppState.State, _ subState: AppState.SubState = .none) {
        appState.set(state, subState)
    }
    
    private func createDebugStateChanger() -> some View {
        return GeometryReader { geo in
            let frameH: CGFloat = geo.size.height,
                frameW: CGFloat = geo.size.width
            ZStack {
                Color.clear.onAppear() {
                    appState.appFrameSize = geo.size
                }
                
                Rectangle()
                    .foregroundStyle(appTheme.accentThree)
                    .cornerRadius(5)
                    .frame(width: frameW / 3,
                           height: frameH / 5)
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 1)) {
                            displaying = !displaying
                        }
                    }// end of tab to open / close debug menu
                
                
                HStack(spacing: 5) {
                    Spacer(minLength: 3)
                    VStack(alignment: .center, spacing: 10) {
                        let firstState: AppState.State = .logo
                        
                        Button("Prev") {
                            if (appState.state == firstState) {
                                appState.set(firstState)
                            }
                            else {
                                appState.set(appState.state.previous())
                            }
                        }
                        
                        Button("Prev Sub") {
                        }
                        .foregroundStyle(appTheme.accentTwo)
                    } // end of previous button vstack
                    .padding(2)
                    .background(appTheme.secondary)
                    .foregroundStyle(appTheme.primary)
                    .cornerRadius(5)
                    Spacer(minLength: 3)
                    Divider()
                        .foregroundStyle(appTheme.accentTwo)
                    HStack(alignment: .center) {
                        Spacer(minLength: 3)
                        VStack(alignment: .center) {
                            Text("State: ")
                                .font(.default.italic())
                                .padding(4)
                                .cornerRadius(5)
        
                            Text("\(appState.state)")
                                .fontWeight(.semibold)
                                .padding(4)
                                .cornerRadius(5)
                        }
                        VStack(alignment: .center) {
                            Text("Substate:")
                                .font(.default.italic())
                                .padding(4)
                                .cornerRadius(5)
                            
                            Text("\(appState.subState)")
                                .fontWeight(.semibold)
                                .padding(4)
                                .cornerRadius(5)
                        }
                        Spacer(minLength: 3)
                    }
                    .background(appTheme.accentOne)
                    .cornerRadius(5)
                    Divider()
                        .foregroundStyle(appTheme.accentTwo)
                    Spacer()
                    VStack(alignment: .center, spacing: 10) {
                        let lastState: AppState.State = .chatting
                        
                        Button("Next") {
                            if (appState.state == lastState) {
                                appState.set(lastState)
                            }
                            else {
                                appState.set(appState.state.next())
                            }
                        }
                        
                        Button("Next Sub") {
                        }
                        .foregroundStyle(appTheme.accentTwo)
                    } // end of next button vstack
                    .padding(2)
                    .background(appTheme.secondary)
                    .foregroundStyle(appTheme.primary)
                    .cornerRadius(5)
                    Spacer()
                } // End of HStack
                .frame(width: geo.size.width,
                       height: geo.size.height / 8)
                .background(appTheme.primary)
            }// end of ZStack
        } // end of GeometryReader
    } // end of createStateHeader function
} // end of Preview extension

#Preview {
    PreviewContainer() {
        LobbyView()
    }
}

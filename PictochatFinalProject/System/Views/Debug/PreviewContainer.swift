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
        VStack {
            createDebugStateChanger()
            content
                .environmentObject(appState)
                .environmentObject(blinder)
                .environmentObject(bgObserver)
                .environmentObject(audioEngine)
        }
    }
    
    private func createDebugStateChanger() -> some View {
        return GeometryReader { geo in
            VStack {
                HStack (alignment: .center, spacing: 5) {
                    let stateAsInt: Int = appState.currentState.rawValue,
                        maxStates: Int = AppState.State.allCases.count,
                        atMin: Bool = (stateAsInt <= AppState.State.logo.rawValue),
                        atMax: Bool = (stateAsInt <= (maxStates - 1))
                    // Start of Previous State button
                    Button("Previous") {
                        if (atMin) {
                            return
                        }
                        
                        appState.currentState.previous()
                    }
                    .padding()
                    .background(.black)
                    .foregroundStyle(atMin ?
                        .gray : Color.accentColor)
                    .cornerRadius(5)
                    .shadow(radius: 5)
                    // End of Previous State button
                    
                    // Start of state display
                    HStack (alignment: .center, spacing: 10) {
                        VStack (alignment: .center) {
                            Text("State:")
                                .font(.callout)
                                .fontDesign(.rounded)
                            Text("\(appState.currentState)")
                                .font(.caption)
                        }
                        .foregroundStyle(Color.yellow)
                        
                        VStack (alignment: .center) {
                            Text("Substate:")
                                .font(.callout)
                            Text("\(appState.currentSubState)")
                                .font(.caption)
                        }
                        .foregroundStyle(Color.yellow)
                    }
                    .padding()
                    .background(.black)
                    .cornerRadius(5)
                    // end of state display
                    
                    // Start of Next State button
                    Button("Next") {
                        // If we've hit the max amount of cases
                        // we can't increase
                        if (atMax) {
                            return
                        }
                        
                        appState.currentState.next()
                    }
                    .padding()
                    .background(.black)
                    .foregroundStyle((atMax) ? Color.accentColor : .gray)
                    .cornerRadius(5)
                    .shadow(radius: 5)
                    // End of next state button
                } // End of HStack
                .frame(width: geo.size.width,
                       height: geo.size.height / 6)
                .background(Color.appPrimaryAccent)
            } // end of VStack
        } // end of GeometryReader
    } // end of createStateHeader function
} // end of Preview extension

#Preview {
    @Previewable @EnvironmentObject var bgObserver: GridLineBackgroundObserver
    
    PreviewContainer() {
        LobbyView()
            .environmentObject(bgObserver)
    }
}

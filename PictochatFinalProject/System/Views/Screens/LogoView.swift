//
//  Logo.swift
//  PictochatFinalProject
//
//  Created by Jacob Martin on 2/4/26.
//
import SwiftUI
import AVFoundation

struct LogoView: View {
    @EnvironmentObject internal var appState: AppState
    @EnvironmentObject internal var bgObserver: GridLineBackgroundObserver
    @EnvironmentObject internal var blinder: Blinder
    @EnvironmentObject internal var audioEngine: AudioEngine

    var body: some View {
        GeometryReader { geo in
            let frameH = geo.size.height,
                frameW = geo.size.width
            
            ZStack {
                VStack{
                    AppLogo()
                        .frame(width: frameH / 4,
                               height: frameW / 4)
                }
            }
            .offset(x: frameW / 2,
                    y: frameH / 2)// end of Main VStack
            
        }.onAppear() {
            blinder.show()
            
            Timer.scheduledTimer(withTimeInterval: 4, repeats: false) {_ in
                audioEngine.changeToFile("logo_jingle", withExtension: "mp3")
                
                withAnimation(.easeInOut(duration: 2)) {
                    audioEngine.play()
                    blinder.hide()
                }
            }
            
            Timer.scheduledTimer(withTimeInterval: 8, repeats: false) {_ in
                withAnimation(.easeInOut(duration: 2)) {
                    blinder.show()
                }
            } // End of Fade out timer
            
            Timer.scheduledTimer(withTimeInterval: 10, repeats: false) {_ in
                appState.set(.lobby, newSubState: .lobbyPrivateTab)
            } // End of state change timer
        }
    } // end of Body
} // end of LogoView

#Preview {
    @Previewable @StateObject var appState: AppState = AppState()
    @Previewable @StateObject var bgObserver: GridLineBackgroundObserver = GridLineBackgroundObserver()
    @Previewable @StateObject var blinder: Blinder = Blinder()
    @Previewable @StateObject var audioEngine: AudioEngine = AudioEngine(soundPath: .none)
    
    LogoView()
        .environmentObject(appState)
        .environmentObject(bgObserver)
        .environmentObject(blinder)
        .environmentObject(audioEngine)
}
  

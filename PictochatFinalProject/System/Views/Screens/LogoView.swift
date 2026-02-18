//
//  Logo.swift
//  PictochatFinalProject
//
//  Created by 2155097-050 on 2/4/26.
//
import SwiftUI
import AVFoundation

struct LogoView: View {
    @EnvironmentObject var audioPlayer: AudioEngine
    @EnvironmentObject var appState: AppState
    @EnvironmentObject var blinder: Blinder

    var body: some View {
        GeometryReader { geo in
            let frameH = geo.size.height,
                frameW = geo.size.width
            
            VStack {
                AppLogo()
                AppTitle(borderWidth: 0,
                         fontDesign: .monospaced,
                         fontStyle: .largeTitle,
                         fontWeight: .bold)
            }.frame(width: frameW / 2,
                    height: frameH / 2)
            .offset(x: frameW / 4,
                    y: frameH / 4)// end of Main VStack
        }.onAppear() {
            blinder.show()
            print(Bundle.main.bundlePath)
            
            Timer.scheduledTimer(withTimeInterval: 4, repeats: false) {_ in
                audioPlayer.changeToFile("logo_jingle", withExtension: "mp3")
                
                withAnimation(.easeInOut(duration: 2)) {
                    audioPlayer.play()
                    blinder.hide()
                }
            }
            
            Timer.scheduledTimer(withTimeInterval: 8, repeats: false) {_ in
                withAnimation(.easeInOut(duration: 2)) {
                    blinder.show()
                }
            } // End of Fade out timer
            
            Timer.scheduledTimer(withTimeInterval: 10, repeats: false) {_ in
                appState.set(.lobby)
            } // End of state change timer
        }
    } // end of Body
} // end of LogoView

#Preview {
    @Previewable @StateObject var audioPlayer: AudioEngine = AudioEngine(soundPath: .none)
    @Previewable @StateObject var appState: AppState = AppState()
    @Previewable @StateObject var blinder: Blinder = Blinder()
    
    ZStack {
        LogoView()
            .environmentObject(audioPlayer)
            .environmentObject(appState)
            .environmentObject(blinder)
        blinder.shape
            .foregroundStyle(Color.blinderColor)
            .opacity(blinder.displaying ? 1 : 0)
    }
}
  

//
//  Logo.swift
//  PictochatFinalProject
//
//  Created by Jacob Martin on 2/4/26.
//
import SwiftUI
import AVFoundation

struct LogoView: View {
    @Environment(\.appTheme) internal var appTheme: AppTheme
    @EnvironmentObject internal var appState: AppState
    @EnvironmentObject internal var bgObserver: GridLineBackgroundObserver
    @EnvironmentObject internal var blinder: Blinder
    @EnvironmentObject internal var audioEngine: AudioEngine

    var body: some View {
        GeometryReader { geo in
            let frameH: CGFloat = geo.size.height,
                frameW: CGFloat = geo.size.width,
                center: CGSize = calculateCenterOffset(frameH: frameH,
                                                       frameW: frameW)
            
            VStack(alignment: .center) {
                AppLogo()
                    .frame(width: frameW / 2,
                           height: frameW / 2)
                AppTitle()
                    .padding()
                    .shadow(radius: 2)
                    .background(
                        LinearGradient(
                            colors: [.accentColor,
                                     appTheme.blinder],
                            startPoint: .top,
                            endPoint: .bottom)
                    )
                    .frame(width: frameH / 3,
                           height: frameW / 6)
                    .offset(y: frameH * 0.05)
            }
            .offset(center)
        }.task {
            blinder.show()

            
            // This is how to handle asynchronus functions in
            // swift.
            //
            // Here we're sleeping the Task (which
            // is essentialy a thread) for 4 seconds.
            //
            // The try? await will try to sleep the current
            // thread for 4 seconds. If for some reason
            // this gets interrupted an error will be thrown
            // and the code will stop.
            try? await Task.sleep(for: .seconds(2))
            
            // Set up and play the start up jingle and
            // unhide the screen
            audioEngine.changeToFile("logo_jingle", withExtension: "mp3")
            withAnimation(.easeInOut(duration: 2)) {
                audioEngine.play()
                blinder.hide()
            }
            
            // sleep again!
            try? await Task.sleep(for: .seconds(4.25))
            
            // Hide the screen to transition
            withAnimation(.easeInOut(duration: 2)) {
                blinder.show()
            }
            
            // Fake loading, ensure that we switch
            // before the user can see! :)
            try? await Task.sleep(for: .seconds(2))
            
            // Switch screens!
            appState.set(.lobby, subState: .lobbyPublicTab)
        }
    } // end of Body
    
    func calculateCenterOffset(frameH: CGFloat, frameW: CGFloat) -> CGSize {
        var output: CGSize
        if (frameH > frameW) {
            output = CGSize(width: frameW / 5.5,
                             height: frameH / 4)
        } else if (frameW > frameH) {
            output = CGSize(width: frameW / 5.5,
                             height: frameH / 4)
        } else {
            output = CGSize.zero
        }
        return output
    }
} // end of LogoView

#Preview {
    PreviewContainer {
        LogoView()
    }
}
  

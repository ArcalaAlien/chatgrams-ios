//
//  Logo.swift
//  PictochatFinalProject
//
//  Created by 2155097-050 on 2/4/26.
//
import SwiftUI

struct LogoView: View {
    @State private var onScreen: Bool = false
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        VStack {
            // MARK: - AppLogo START
            AppLogo()
                .frame(width: 250, height: 250)
                .onAppear {
                    // MARK: - Turn On Logo
                    withAnimation(Animation.easeIn(duration: 2)) {
                        onScreen = true
                    }
                    
                    // MARK: - Fade Out Timer
                    //Fade Out: 1 sec, Hold: 3 Sec, Fade Out: 1 Sec
                    Timer.scheduledTimer(withTimeInterval: 6, repeats: false) {_ in
                        withAnimation(Animation.easeOut(duration: 2)) {
                            onScreen = false
                        }
                    } // End of fade out timer
                } // end of onAppear
                .opacity(onScreen ? 1 : 0)
            // MARK: - AppLogo FINISH
            
            // MARK: - AppTitle START
            AppTitle(borderWidth: 0,
                     fontDesign: .monospaced,
                     fontStyle: .largeTitle,
                     fontWeight: .bold)
            .frame(width: 300, height: 50)
            .onAppear {
                Timer.scheduledTimer(withTimeInterval: 6, repeats: false) {_ in
                    withAnimation(Animation.easeOut(duration: 1)) {
                        onScreen.toggle()
                    }
                }// end of fade out timer
                
                withAnimation(Animation.easeIn(duration: 1)) {
                    onScreen.toggle()
                }
            } // end of onAppear
            .opacity(onScreen ? 1 : 0)
            // MARK: - AppTitle FINISH
        } // end of Main VStack
        .frame(width: 400, height: 400)
        .onAppear() {
            // MARK: - STATE CHANGE TIMER
            Timer.scheduledTimer(withTimeInterval: 7, repeats: false) { _ in
                appState.currentState = .lobby
            }
        } // End of VStack onAppear
    } // end of Body
} // end of LogoView

#Preview {
    @Previewable @StateObject var appState:AppState = AppState()
    LogoView().environmentObject(appState)
}
  

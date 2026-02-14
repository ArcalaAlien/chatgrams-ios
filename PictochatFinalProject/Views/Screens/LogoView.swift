//
//  Logo.swift
//  PictochatFinalProject
//
//  Created by 2155097-050 on 2/4/26.
//
import SwiftUI

struct LogoView: View {
    @State var currentState: AppState.validStates
    @State private var onScreen: Bool = false
    
    var body: some View {
        // MARK: - AppLogo Start
        VStack {
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
                            onScreen = false;
                        }
                    } // End of fade out timer
                } // end of onAppear
                .opacity(onScreen ? 1 : 0)
            // MARK: - AppLogo Finish
            
            // MARK: - AppTitle Start
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
            // MARK: - AppTitle Finish
        }
        .frame(width: 400, height: 400)
        // end of VStack
    } // end of body
}

#Preview {
    LogoView(currentState: .logo)
}

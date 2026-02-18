//
//  Logo.swift
//  PictochatFinalProject
//
//  Created by 2155097-050 on 2/4/26.
//
import SwiftUI

struct LogoView: View {
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
            blinder.displaying = true
            
            Timer.scheduledTimer(withTimeInterval: 4, repeats: false) {_ in 
                withAnimation(.easeInOut) {
                    blinder.displaying = false
                }
            }
        }
    } // end of Body
} // end of LogoView

#Preview {
    @Previewable @StateObject var appState: AppState = AppState()
    @Previewable @StateObject var blinder: Blinder = Blinder()
    
    ZStack {
        LogoView()
            .environmentObject(appState)
            .environmentObject(blinder)
        blinder.shape
            .foregroundStyle(Color.blinderColor)
    }
}
  

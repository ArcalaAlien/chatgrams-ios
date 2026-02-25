//
//  BlinderState.swift
//  PictochatFinalProject
//
//  Created by Jacob Martin on 2/17/26.
//

import SwiftUI
internal import Combine

class Blinder: ObservableObject {
    @Published var displaying: Bool
    @Published var shape: AnyShape

    init() {
        shape = AnyShape(Rectangle())
        displaying = false
    }
    
    init(displaying: Bool,
         shape: AnyShape) {
        self.displaying = displaying
        self.shape = shape
    }
    
    func shape(_ shape: AnyShape) -> AnyShape {
        self.shape = shape
        return self.shape
    }
    
    func displaying(_ displaying: Bool) -> Blinder {
        self.displaying = displaying
        return self
    }
    
    func show() {
        self.displaying = true
    }
    
    func hide() {
        self.displaying = false
    }
}


#Preview {
    @Previewable @EnvironmentObject var appTheme: AppTheme
    @Previewable @StateObject var blinder: Blinder = Blinder()
    
    VStack {
        ZStack {
            Circle()
                .foregroundStyle(appTheme.accentThree)
            
            blinder.shape
                .foregroundStyle(appTheme.background)
                .opacity(blinder.displaying ? 1 : 0)
        }.frame(width: 300,
                height: 300)
        
        Button(action: {
            withAnimation(.easeInOut) {
                blinder.displaying = !blinder.displaying
            }
        }, label: {
            Text(blinder.displaying ? "Turn Off" : "Turn On")
        })
    }
}

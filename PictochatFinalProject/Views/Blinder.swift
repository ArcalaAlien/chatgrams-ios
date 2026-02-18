//
//  BlinderState.swift
//  PictochatFinalProject
//
//  Created by 2155097-050 on 2/17/26.
//

import SwiftUI
internal import Combine

class Blinder: ObservableObject {
    @Published var displaying: Bool
    @Published var shape: AnyShape

    init() {
        shape = AnyShape(Rectangle())
        displaying = true
    }
    
    init(displaying: Bool,
         shape: AnyShape) {
        self.displaying = displaying
        self.shape = shape
    }
    
    func shape(_ shape: AnyShape) -> Blinder {
        self.shape = shape
        return self
    }
    
    func displaying(_ displaying: Bool) -> Blinder {
        self.displaying = displaying
        return self
    }
    
    func show() -> Blinder {
        self.displaying = true
        return self
    }
    
    func hide() -> Blinder{
        self.displaying = false
        return self
    }
}


#Preview {
    @Previewable @Environment(\.colorScheme) var colorScheme
    @Previewable @StateObject var blinder: Blinder = Blinder()
    
    VStack {
        ZStack {
            Circle()
                .foregroundStyle(Color.teal)
            
            blinder.shape
                .foregroundStyle(Color.blinderColor)
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

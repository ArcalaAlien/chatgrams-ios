//
//  AppTitle.swift
//  PictochatFinalProject
//
//  Created by Jacob Martin on 2/8/26.
//

import SwiftUI

struct AppTitle: View {

    var body: some View {
        GeometryReader { geo in
            let frameH: CGFloat = geo.size.height,
                frameW: CGFloat = geo.size.width
            
            var adjustedFrameH: CGFloat {
                if (frameH < frameW) {
                    return frameH / 1.5
                }
                
                return frameH
            }
            
            var adjustedFrameW: CGFloat {
                if (frameW < frameH) {
                    return frameW / 1.5
                }
                
                return frameW
            }
            
            var adjustedOffsetH: CGFloat {
                if (frameH < frameW) {
                    return frameH / 6
                }
                
                return 0
            }
            
            var adjustedOffsetW: CGFloat {
                if (frameW < frameH) {
                    return frameW / 6
                }
                
                return 0
            }
            
            VStack {
                Text("ChatGrams")
                    .padding()
                    .frame(width: adjustedFrameW,
                           height: adjustedFrameH)
                    .font(.largeTitle)
                    .fontDesign(.monospaced)
                    .fontWeight(.semibold)
            }.offset(x: adjustedOffsetW,
                     y: adjustedOffsetH)
        }
    }
}

#Preview {
    AppTitle()
        .frame(width: 300, height: 100)
        .background(.red)
}

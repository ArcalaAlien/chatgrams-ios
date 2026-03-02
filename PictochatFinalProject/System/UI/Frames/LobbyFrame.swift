//
//  LobbyFrame.swift
//  PictochatFinalProject
//
//  Created by 2155097-050 on 2/21/26.
//

import SwiftUI

struct LobbyFrame: View {
    @EnvironmentObject var appTheme: AppTheme
    
    var body: some View {
        GeometryReader { geo in
            let frameW = geo.size.width,
                frameH = geo.size.height
            
            HStack(alignment: .center) {
                Spacer()
                VStack (alignment: .center) {
                    Spacer()
                    Rectangle()
                        .frame(width: frameW / 1.125, height: frameH / 1.125)
                        .foregroundStyle(LinearGradient(
                            colors: [appTheme.primary.opacity(0.9),
                                     appTheme.primary.opacity(0.5),
                                     .clear],
                            startPoint: .top,
                            endPoint: .bottom))
                    
                    Button(action: {},
                           label: {Text("Settings")
                                    .fontWeight(.bold)
                                    .fontDesign(.monospaced)})
                    .padding()
                    .foregroundStyle(appTheme.primary)
                    .background(
                        LinearGradient(
                            colors: [.clear,
                                     appTheme.primary.opacity(0.5),
                                     appTheme.primary.opacity(0.9)],
                            startPoint: .top,
                            endPoint: .bottom))
                    Spacer()
                }
                Spacer()
            }
        }
    }
}

#Preview {
    PreviewContainer {
        LobbyFrame()
    }
}

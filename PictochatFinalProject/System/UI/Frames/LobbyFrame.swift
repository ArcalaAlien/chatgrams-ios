//
//  LobbyFrame.swift
//  PictochatFinalProject
//
//  Created by 2155097-050 on 2/21/26.
//

import SwiftUI

struct LobbyFrame: View {
    var body: some View {
        Rectangle()
            .frame(width: 300, height: 300)
    }
}

#Preview {
    var previewContainer = PreviewContainer {LobbyFrame()}
    
    GeometryReader { geo in
        ZStack {
            previewContainer.bgObserver.background
                .task {
                    previewContainer.changeStateTo(.lobby, .publicGroups)
                    print("\(previewContainer.appState.state)")
                }
            previewContainer.content
        }
    }
}

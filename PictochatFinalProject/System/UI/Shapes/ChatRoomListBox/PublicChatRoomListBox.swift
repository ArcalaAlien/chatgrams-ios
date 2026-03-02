//
//  PublicChatRoomListBox.swift
//  PictochatFinalProject
//
//  Created by 2155097-050 on 2/27/26.
//

import SwiftUI

struct PublicChatRoomListBox: View {
    @EnvironmentObject var appTheme: AppTheme
    
    var iconType: PublicChatRoomListIconType = .iconA
    private var accentColor: Color {
        switch(iconType) {
            case .iconA:
                return appTheme.accentOne
            case .iconB:
                return appTheme.accentTwo
            case .iconC:
                return appTheme.accentThree
            case .iconD:
                return appTheme.accentFour
            case .iconE:
                return appTheme.accentFive
        }
    }
    
    var body: some View {
        GeometryReader { geo in
            let frameH = geo.size.height,
                frameW = geo.size.width
            
            ZStack {
                HStack {
                    Spacer()
                    PublicChatRoomListIcon(iconType)
                        .frame(width: frameW / 2.5,
                               height: frameH / 1.25)
                    Spacer()
                    VStack {
                        ZStack {
                            HStack {
                                Text("In Chat\n[ 0 \\ 16]")
                                    .padding(5)
                                    .multilineTextAlignment(.center)
                                    .background(appTheme.primary.opacity(0.6))
                                    .foregroundStyle(appTheme.background)
                                    .fontDesign(.monospaced)
                                    .bold()
                            } // end of HStack
                            .padding()
                            .background(
                                LinearGradient(
                                    gradient:
                                        Gradient(
                                            colors: [accentColor,
                                                     appTheme.background]),
                                    startPoint: .trailing,
                                    endPoint: .leading))
                        } // end of ZStack
                        Button(action: {},
                               label: {
                            Text("Join")
                                .padding(5)
                                .background(appTheme.primary.opacity(0.6))
                                .foregroundStyle(appTheme.background)
                                .fontDesign(.monospaced)
                                .bold()
                                .italic()
                        })
                        .padding(10)
                        .background(
                            LinearGradient(
                                gradient:
                                    Gradient(
                                        colors: [accentColor,
                                                 appTheme.background]),
                                startPoint: .trailing,
                                endPoint: .leading))
                        .frame(width: frameW / 2.25,
                               height: frameH / 16)
                    } // end of VStack
                    Spacer()
                } // end of HStack
            } // end of ZStack
            .environmentObject(appTheme)
        }
    }
}


#Preview {
    PreviewContainer {
        GeometryReader { geo in
            PublicChatRoomListBox(iconType: .iconA)
                .offset(y: 300)
        }

    }
}

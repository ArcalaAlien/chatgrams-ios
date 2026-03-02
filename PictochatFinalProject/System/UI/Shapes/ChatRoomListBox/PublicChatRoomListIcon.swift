//
//  PublicChatRoomListIcon.swift
//  PictochatFinalProject
//
//  Created by 2155097-050 on 2/27/26.
//

import SwiftUI

struct PublicChatRoomListIcon: View {
    @EnvironmentObject var appTheme: AppTheme
    
    var iconType: PublicChatRoomListIconType
    
    init(_ iconType: PublicChatRoomListIconType) {
        self.iconType = iconType
    }
    
    private var iconColor: Color {
        switch(self.iconType) {
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
    
    private var iconString: String {
        switch(self.iconType) {
            case .iconA:
                return PublicChatRoomListIcon.iconABinary
            case .iconB:
                return PublicChatRoomListIcon.iconBBinary
            case .iconC:
                return PublicChatRoomListIcon.iconCBinary
            case .iconD:
                return PublicChatRoomListIcon.iconDBinary
            case .iconE:
                return PublicChatRoomListIcon.iconEBinary
        }
    }
    
    static var iconABinary: String = "0111010001111111000110001"
    static var iconBBinary: String = "1111010001111111000111110"
    static var iconCBinary: String = "0111110000100001000001111"
    static var iconDBinary: String = "1111010001100011000111110"
    static var iconEBinary: String = "1111110000111101000011111"
    
    var body: some View {
        GeometryReader { geo in
            let frameH: CGFloat = geo.size.height,
                frameW: CGFloat = geo.size.width
            
            ZStack {
                Grid(alignment: .topTrailing, horizontalSpacing: 0, verticalSpacing: 0) {
                    // Convert the string for the icon display
                    // into an array for eay reading
                    let pixels = Array(iconString)
                    ForEach(0..<5) { i in
                        GridRow {
                            ForEach(0..<5) { j in
                                Rectangle()
                                .foregroundStyle(
                                    pixels[i * 5 + j] == "1" ?
                                        iconColor :
                                        .black
                                )
                            } // end of ForEach Button
                        } // end of GridRow
                    } // end of ForEach row
                } // end of Grid
                
                GridLines(GridLineStyle()
                    .cellSize(CGSize(width: frameW / 5,
                                     height: frameH / 5))
                    .lineShading(.color(appTheme.primary))
                )
            } // end of ZStack
        } // end of Geometry Reader
    } // end of body
} // end of struct

#Preview {
    PreviewContainer {
        PublicChatRoomListIcon(.iconB)
            .frame(width: 200 , height: 200)
    }
}

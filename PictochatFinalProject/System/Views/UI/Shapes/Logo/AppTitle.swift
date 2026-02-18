//
//  AppTitle.swift
//  PictochatFinalProject
//
//  Created by 2155097-050 on 2/8/26.
//

import SwiftUI

struct AppTitle: View {
    var borderWidth: CGFloat
    var borderRadius: CGFloat = 2
    var borderColor: Color = .primary
    var gradient: some ShapeStyle {
        LinearGradient(
            colors: [.white, .accentColor],
            startPoint: .top,
            endPoint: .bottom)
    }
    var font: Font = .largeTitle
    var fontDesign: Font.Design = .default
    var fontStyle: Font.TextStyle = .title
    var fontWeight: Font.Weight = .bold
    
    
    var body: some View {
        GeometryReader { proxy in
            VStack {
                // MARK: - Logo Title
                Text("ChatGrams")
                    .frame(width: proxy.size.width * 0.95,
                           height: proxy.size.height * 0.15,
                           alignment: .center)
                    .padding([.top, .bottom], 15)
                    .background(gradient)
                    .cornerRadius(borderRadius)
                    .border(.black, width: borderWidth)
                    .cornerRadius(borderRadius)
                    .fontDesign(fontDesign)
            }.position(x: proxy.size.width / 2,
                       y: proxy.size.height / 2)
        }
    }
}

#Preview {
    AppTitle(borderWidth: 3)
        .frame(width: 250, height: 100)
}

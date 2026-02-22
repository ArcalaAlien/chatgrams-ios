//
//  GridLineBackgroundObserver.swift
//  PictochatFinalProject
//
//  Created by Jacob Martin on 2/19/26.
//

import SwiftUI
internal import Combine

class GridLineBackgroundObserver: ObservableObject {
    @Environment(\.self) var environment: EnvironmentValues
    @Published internal var background: GridLineBackground
    
    init() {
        background = GridLineBackground()
    }
    
    func changeGradientsFromState (_ appState: AppState, appTheme: AppTheme, gradientStart: CGPoint, gradientEnd: CGPoint) {
        let state = appState.state,
            subState = appState.subState
        
        let accentOne = DynamicColor(color: appTheme.accentOne),
            accentTwo = DynamicColor(color: appTheme.accentTwo),
            accentThree = DynamicColor(color: appTheme.accentThree),
            accentFour = DynamicColor(color: appTheme.accentFour)
        
        withAnimation(.easeIn(duration: 4)) {
            switch (state) {
                case .logo:
                    background = background.bottomShading(.color(appTheme.background))
                    background = background.topShading(.color(appTheme.background))
                case .lobby:
                    switch(subState) {
                        case .publicGroups:
                            background = background.bottomShading(.color(.black))
                            background = background.topShading(
                                .linearGradient(
                                    Gradient(
                                        colors: [accentOne.darken(by: 100).toColor(in: environment),
                                                 accentTwo.darken(by: 100).toColor(in: environment)]),
                                        startPoint: gradientStart,
                                        endPoint: gradientEnd))
                        case .privateGroups:
                            background = background.bottomShading(.color(.black))
                            background = background.topShading(
                                .linearGradient(
                                    Gradient(
                                        colors: [accentThree.darken(by: 100).toColor(in: environment),
                                                 accentTwo.darken(by: 100).toColor(in: environment)]),
                                        startPoint: gradientStart,
                                        endPoint: gradientEnd))
                        default:
                            background = background.bottomShading(.color(appTheme.background))
                            background = background.topShading(.color(appTheme.background))
                    }
                case .chatting:
                    background = background.bottomShading(.color(.black))
                    background = background.topShading(
                        .linearGradient(
                            Gradient(
                                colors: [accentOne.darken(by: 100).toColor(in: environment),
                                         accentThree.darken(by: 100).toColor(in: environment)]),
                            startPoint: gradientStart,
                            endPoint: gradientEnd))
                case .settings:
                    background = background.bottomShading(.color(.black))
                    background = background.topShading(
                        .linearGradient(
                            Gradient(
                                colors: [accentOne.darken(by: 100).toColor(in: environment),
                                        accentFour.darken(by: 100).toColor(in: environment)]),
                                startPoint: gradientStart,
                                endPoint: gradientEnd))
                default:
                    background = background.bottomShading(.color(appTheme.background))
                    background = background.topShading(.color(appTheme.background))
            }
        }
    }
}

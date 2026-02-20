//
//  EnvironmentValues.swift
//  PictochatFinalProject
//
//  Created by Jacob Martin on 2/18/26.
//
import SwiftUI

private struct AppStateKey: EnvironmentKey {
    static let defaultValue: AppState = AppState()
}

private struct ScreenSizeKey: EnvironmentKey {
    static let defaultValue: CGSize = .zero
}

private struct AudioEngineKey: EnvironmentKey {
    static let defaultValue: AudioEngine = AudioEngine(soundPath: .none)
}

private struct BackgroundObserverKey: EnvironmentKey {
    static let defaultValue: GridLineBackgroundObserver = GridLineBackgroundObserver()
}

private struct BlinderKey: EnvironmentKey {
    static let defaultValue: Blinder = Blinder()
}

extension EnvironmentValues {
    var appState: AppState {
        get {self[AppStateKey.self]}
        set {self[AppStateKey.self] = newValue}
    }
    
    var screenSize: CGSize {
        get {self[ScreenSizeKey.self]}
        set {self[ScreenSizeKey.self] = newValue}
    }
    
    var audioEngine: AudioEngine {
        get {self[AudioEngineKey.self]}
        set {self[AudioEngineKey.self] = newValue}
    }
    
    var bgObserver: GridLineBackgroundObserver {
        get {self[BackgroundObserverKey.self]}
        set {self[BackgroundObserverKey.self] = newValue}
    }
    
    var blinder: Blinder {
        get {self[BlinderKey.self]}
        set {self[BlinderKey.self] = newValue}
    }
}

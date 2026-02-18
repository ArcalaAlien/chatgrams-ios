//
//  EnvironmentValues.swift
//  PictochatFinalProject
//
//  Created by 2155097-050 on 2/18/26.
//
import SwiftUI
import AVFoundation

extension EnvironmentValues {
    @Entry var fileManager: FileManager = .default
}

extension View {
    func fileManager(_ fileManager: FileManager) -> some View {
        environment(\.fileManager, fileManager)
    }
}

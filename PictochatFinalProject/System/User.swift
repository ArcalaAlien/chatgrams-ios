//
//  User.swift
//  PictochatFinalProject
//
//  Created by 2155097-050 on 2/21/26.
//
import SwiftUI
internal import Combine

class User: ObservableObject {
    @Published var id: UUID = UUID()
    @Published var name: String = "User"
    @Published var color: Color = .accentColor
}

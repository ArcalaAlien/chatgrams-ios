//
//  User.swift
//  PictochatFinalProject
//
//  Created by 2155097-050 on 2/21/26.
//
import SwiftUI
internal import Combine

class User: ObservableObject, Identifiable {
    @Published var id: UUID = UUID()
    
    @Published var name: String = "New User"
    @Published var color: Color = .accentColor
}

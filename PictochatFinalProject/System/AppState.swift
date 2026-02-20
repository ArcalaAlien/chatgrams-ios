//
//  AppState.swift
//  PictochatFinalProject
//
//  Created by Jacob Martin on 2/4/26.
//
import SwiftUI
internal import Combine

class AppState: ObservableObject {
    enum State: Int, CaseIterable {
        case none = -1
        case logo
        case lobby
        case lobbyCreation
        case settings
        case chatting
        
        mutating func next() {
            // Return an updated version of myself
            //
            // Starting by getting an array of all
            // the possible enum states
            let allStates = Self.allCases
            // Then we set ourselves to the next state
            // by getting the first index of ourself
            // and unwrapping the Int?
            //
            // Force unrwapping in this way is safe because of the
            // +1 at the end, ensuring that the lowest index we get
            // is index 0.
            //
            // The modulus to allStates.count will reset us
            // back to 0 if we hit the count.
            let atMax = (allStates.firstIndex(of: self) == allStates.count - 1)
            
            if (!atMax) {
                self = allStates[(allStates.firstIndex(of: self)! + 1) % allStates.count]
            }
        }
        
        mutating func previous() {
            let allStates = Self.allCases,
                atMin = (allStates.firstIndex(of: self) == 0)
            
            if (!atMin) {
                self = allStates[(allStates.firstIndex(of: self)! - 1)]
            }
        }
    }
    
    enum SubState: Int, CaseIterable {
        case none = -1
        case lobbyPublicTab
        case lobbyPrivateTab
    }

    @Published var appFrameSize: CGSize
    @Published var currentState: State
    @Published var currentSubState: SubState
    
    init() {
        appFrameSize = .zero
        currentState = .logo
        currentSubState = .none
    }
    
    func set(_ state: State, subState: SubState = .none) {
        currentState = state
        currentSubState = subState
    } // end of update function
}

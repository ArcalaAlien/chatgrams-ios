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
        case settings
        case chatting
        
        mutating func next() -> AppState.State {
            // Keeping this here to show how I previously achieved
            // this effect, but I minimized this code in the functions
            // below.
            
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
            
            return self
        }
        
        mutating func previous() -> AppState.State {
            let allStates = Self.allCases,
                ourIndex: Int = allStates.firstIndex(of: self)!,
                atMin: Bool = (self == allStates.first)
            
            return (atMin) ? self : allStates[ourIndex - 1]
        }
    }
    
    enum SubState: Int, CaseIterable {
        case none = -1
        case publicGroups
        case privateGroups
        case lobbyCreation
        
        mutating func next() -> AppState.SubState {
            let allSubStates = Self.allCases,
                ourIndex: Int = allSubStates.firstIndex(of: self)!,
                atMax: Bool = (self == allSubStates.last)
            
            return (atMax) ? self : allSubStates[(ourIndex) + 1]
        }
        
        mutating func previous() -> AppState.SubState {
            let allSubStates = Self.allCases,
                ourIndex: Int = allSubStates.firstIndex(of: self)!,
                atMin: Bool = (self == allSubStates.first)
            
            return (atMin) ? self : allSubStates[ourIndex - 1]
        }
    }

    @Published var appFrameSize: CGSize
    @Published var state: State
    @Published var subState: SubState
    
    private var substateLists: Dictionary<State, [SubState]> = [:]
    
    init() {
        appFrameSize = .zero
        state = .logo
        subState = .none
        
        substateLists.updateValue([.publicGroups, .privateGroups, .lobbyCreation], forKey: .lobby)
    }
    
    func hasSubState(for: State) -> Bool {
        if (substateLists.keys.contains(state)) {
            return true
        }
        
        return false
    }
    
    func getSubStateList(_for: State) -> [SubState] {
        if let index = substateLists.index(forKey: _for) {
            return substateLists[index].value
        }
        
        return []
    }
    
    func set(_ state: State, _ subState: SubState) {
        self.state = state
        self.subState = subState
    }
    
    // Sets the app to a specific state,
    // if the app has any substates it will set it to the
    // first substate in the list.
    func set(_ state: State) {
        self.state = state
        
        // A little bit of validation,
        // for states that don't have any substates.
        if (substateLists.index(forKey: state) != nil) {
            self.subState = substateLists[state]!.first!
        }
        else {
            self.subState = .none
        }
    } // end of update function
    
    func set(_ subState: SubState) {
        for list in substateLists {
            if (list.value.contains(subState) &&
                list.key != self.state) {
                self.state = list.key
                break
            }
        }
        
        self.subState = subState
    }
}

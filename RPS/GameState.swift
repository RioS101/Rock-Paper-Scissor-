//
//  GameState.swift
//  RPS
//
//  Created by Riad on 10/14/19.
//  Copyright © 2019 Projectum. All rights reserved.
//

import Foundation

enum GameState {
    case start
    case win
    case lose
    case draw
    
    var statusText: String {
        switch self {
        case .start:
            return "Rock, Paper or Scissors"
        case .win:
            return "You Won!"
        case .lose:
            return "You Lost("
        case .draw:
            return "Draw!"
        }
    }
    
}

//
//  Sign.swift
//  RPS
//
//  Created by Riad on 10/14/19.
//  Copyright © 2019 Projectum. All rights reserved.
//

import Foundation



enum Sign {
    case rock
    case paper
    case scissors
    
    var emojiSign: String {
        switch self {
        case .rock:
            return "👊🏻"
        case .paper:
            return "✋🏻"
        case .scissors:
            return "✌🏻"            
        }
    }
    
    //napiwi ewe switch v switche
    func whoWins(opponentSign: Sign) -> GameState {
        var state: GameState
        
        if self == .rock {
            switch opponentSign {
            case .rock:
                state = .draw
            case .paper:
                state = .lose
            case .scissors:
                state = .win
            }
            
        } else if self == .paper {
            switch opponentSign {
            case .rock:
                state = .win
            case .paper:
                state = .draw
            case .scissors:
                state = .lose
            }
            
        } else /* if mySign.self == .scissors  (chtobi before being init neb*/ {
            switch opponentSign {
            case .rock:
                state = .lose
            case .paper:
                state = .win
            case .scissors:
                state = .draw
            }
        }
        return state
    }
}

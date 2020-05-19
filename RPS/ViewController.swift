//
//  ViewController.swift
//  RPS
//
//  Created by Riad on 10/14/19.
//  Copyright © 2019 Projectum. All rights reserved.
//

import UIKit
import GameplayKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI(state: .start)
    }
    
    func updateUI(state: GameState) {
        statusLabel.text = state.statusText
        switch state {
        case .start:
            view.backgroundColor = UIColor.gray
            appSign.setTitle("🤖", for: .normal)
            playAgainOutlet.isHidden = true
            
            rockOutlet.isEnabled = true
            rockOutlet.isHidden = false
            
            paperOutlet.isEnabled = true
            paperOutlet.isHidden = false
            
            scissorsOutlet.isEnabled = true
            scissorsOutlet.isHidden = false
            
        case .win:
            view.backgroundColor = UIColor.green
            
        case .lose:
            view.backgroundColor = UIColor.red
            
        case .draw:
            view.backgroundColor = UIColor.yellow
        }
    }
    
    func play(myTurn: Sign) {
        //generating value from 0 to 2
        let randomChoice = GKRandomDistribution(lowestValue: 0, highestValue: 2)

        // if you call the nextInt() method on randomChoice, the GKRandomDistribution instance will give you a random Int between the two values specified in the initializer.
        
        //returns computer's sign(choice) based on the generated value above
        func randomSign() -> Sign {
            let sign = randomChoice.nextInt()
            if sign == 0 {
                return .rock
            } else if sign == 1 {
                return .paper
            } else {
                return .scissors
            }
        }
        let computerChoice = randomSign() //simulates computer's choice
        
        let currentRoundState = myTurn.whoWins(opponentSign:computerChoice)
        updateUI(state: currentRoundState)
        
        appSign.setTitle(computerChoice.emojiSign, for: .normal)
        
        rockOutlet.isEnabled = false
        paperOutlet.isEnabled = false
        scissorsOutlet.isEnabled = false
        
        switch myTurn {
        case .rock:
            paperOutlet.isHidden = true
            scissorsOutlet.isHidden = true
            
        case .paper:
            rockOutlet.isHidden = true
            scissorsOutlet.isHidden = true
            
        case .scissors:
            rockOutlet.isHidden = true
            paperOutlet.isHidden = true
        }
        
        playAgainOutlet.isHidden = false
                
    }

    @IBOutlet weak var appSign: UIButton!
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBOutlet weak var rockOutlet: UIButton!
    @IBOutlet weak var paperOutlet: UIButton!
    @IBOutlet weak var scissorsOutlet: UIButton!
    
    @IBOutlet weak var playAgainOutlet: UIButton!
    
    
    
    @IBAction func rockAction(_ sender: Any) {
        play(myTurn: .rock)
    }
    
    @IBAction func paperAction(_ sender: Any) {
        play(myTurn: .paper)
    }
    
    @IBAction func scissorsAction(_ sender: Any) {
        play(myTurn: .scissors)
    }
    
    @IBAction func playAgainAction(_ sender: Any) {
        updateUI(state: .start)

    }
    
}


//
//  GameViewController.swift
//  X'sAndO's
//
//  Created by Robert Jeffers on 6/25/20.
//  Copyright © 2020 AsapInc. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet weak var playersTurnLabel: UILabel!
    @IBOutlet var backgroundGradientView: UIView!
    @IBOutlet weak var player1Label: UILabel!
    @IBOutlet weak var playervsLabel: UILabel!
    @IBOutlet weak var player2Label: UILabel!
    @IBOutlet weak var letsPlayLabel: UILabel!
    
    var whichTurn = 0 // whos turn is it to go?
    
    var matrix: [[Int]] = [[0,0,0],[0,0,0],[0,0,0]]

    var player1 = 0
    var player2 = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // Create a gradient layer.
        let gradientLayer = CAGradientLayer()
        // Set the size of the layer to be equal to size of the display.
        gradientLayer.frame = view.bounds
        // Set an array of Core Graphics colors (.cgColor) to create the gradient.
        // This example uses a Color Literal and a UIColor from RGB values.
        gradientLayer.colors = [#colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1).cgColor, UIColor(red: 120/6, green: 2/17, blue: 6/97, alpha: 1).cgColor]
        // Rasterize this static layer to improve app performance.
        gradientLayer.shouldRasterize = true
        // Apply the gradient to the backgroundGradientView.
        //backgroundGradientView.layer.addSublayer(gradientLayer)
        
        backgroundGradientView.layer.insertSublayer(gradientLayer, at: 0)
        
        startGame()
    }
        
    
    func startGame() {
        
        matrix = [[0,0,0],[0,0,0],[0,0,0]]
        displayMatrix(matrix: matrix)
        
        
        whichTurn = Int.random(in: 1...2)
        
        if (whichTurn == 1) {
           player1 = 1
           player2 = 2
            
            player1Label.text = "Player1 is: X"
            player2Label.text = "PLayer2 is: O"
            
            playersTurnLabel.text = "It is Player1's turn!"
        } else {
            player1 = 2
            player2 = 1
            
            player1Label.text = "Player1 is: O"
            player2Label.text = "PLayer2 is: X"
            
            playersTurnLabel.text = "It is Player2's turn!"
        }
    }
    
    
    override var shouldAutorotate: Bool {
        return false
    }
    

    @IBAction func xOrOButtonClicked(_ sender: Any) {
        
        var tempNumber = 0
            
            if (whichTurn == 1) {
                       tempNumber = player1
                       playersTurnLabel.text = "It is Player1's turn!"
                   } else {
                        tempNumber = player2
                       playersTurnLabel.text = "It is Player2's turn!"
                   }
            guard let button = sender as? UIButton else {
            return
        }
        
        switch button.tag {
        case 1:
            if (matrix[0][0] == 0 ) {
                matrix[0][0] = tempNumber
                nextTurn()
            }
        case 2:
        if (matrix[0][1] == 0 ) {
            matrix[0][1] = tempNumber
            nextTurn()
        }
        case 3:
        if (matrix[0][2] == 0 ) {
            matrix[0][2] = tempNumber
            nextTurn()
        }
        case 4:
        if (matrix[1][0] == 0 ) {
            matrix[1][0] = tempNumber
            nextTurn()
        }
        case 5:
        if (matrix[1][1] == 0 ) {
            matrix[1][1] = tempNumber
            nextTurn()
        }
        case 6:
        if (matrix[1][2] == 0 ) {
            matrix[1][2] = tempNumber
            nextTurn()
        }
        case 7:
        if (matrix[2][0] == 0 ) {
            matrix[2][0] = tempNumber
            nextTurn()
        }
        case 8:
        if (matrix[2][1] == 0 ) {
            matrix[2][1] = tempNumber
            nextTurn()
        }
        case 9:
        if (matrix[2][2] == 0 ) {
            matrix[2][2] = tempNumber
            nextTurn()
        }
        
        default:
            print("Errors")
            
        }
    }

    func nextTurn() {
        displayMatrix(matrix: matrix)
        whoWon()
        
        if (whichTurn == 1) {
            whichTurn = 2
            playersTurnLabel.text = "Player 2's turn"
        } else {
            whichTurn = 1
             playersTurnLabel.text = "Player 1's turn"
        }
        
    }
    
    func whoWon() {
        
        var counter = true
        
        if ((matrix[0][0] == matrix[1][1]) && (matrix[1][1] == matrix[2][2])) && matrix[1][1] != 0 {
            winner(whoWon: matrix[1][1])
        } else if ((matrix[2][0] == matrix[1][1]) && (matrix[1][1] == matrix[0][2])) && matrix[1][1] != 0 {
            winner(whoWon: matrix[1][1])
        } else {
            for i in 0...2 {
                if ((matrix[i][0] == matrix[i][1]) && ( matrix[i][1] == matrix[i][2] && matrix[i][0] != 0 )) {
                    winner(whoWon: matrix[i][0])
                    counter = false
                }
            }
            
            if counter {
                for i in 0...2 {
                    if ((matrix[0][i] == matrix[1][i]) && ( matrix[1][i] == matrix[2][i] && matrix[0][i] != 0 )) {
                        winner(whoWon: matrix[0][i])
                    }
                }
            }
            
        }
    }
    
    func winner(whoWon: Int) {
     
        if (whoWon == player1 ) {
            letsPlayLabel.text = "Player 1 has won!"
        } else if (whoWon == player2) {
            letsPlayLabel.text = "Player 2 has won!"
        } else {
        
        }
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
    func displayMatrix(matrix: [[Int]]) {
        var tempTag = 1
        
        for i in 0...2 {
            for j in 0...2 {
                if (matrix[i][j] == 0) {
                    let tempButton = self.view.viewWithTag(tempTag) as? UIButton
                    tempButton?.setBackgroundImage(nil, for: .normal)
                } else if (matrix[i][j] == 1) {
                    let tempButton = self.view.viewWithTag(tempTag) as? UIButton
                    tempButton?.setBackgroundImage(UIImage(named: "PngItem_1947638"), for: .normal)
                } else if (matrix[i][j] == 2) {
                    let tempButton = self.view.viewWithTag(tempTag) as? UIButton
                    tempButton?.setBackgroundImage(UIImage(named: "PngItem_1100393"), for: .normal)
                } else {
                    
                }
                
                tempTag += 1
            }
        }
    }
    
}

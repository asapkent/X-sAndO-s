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
        } else {
            player1 = 2
            player2 = 1
        }
    }
    
    
    override var shouldAutorotate: Bool {
        return false
    }
    

    @IBAction func xOrOButtonClicked(_ sender: Any) {
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

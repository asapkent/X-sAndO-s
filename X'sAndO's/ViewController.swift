//
//  ViewController.swift
//  X'sAndO's
//
//  Created by Robert Jeffers on 6/25/20.
//  Copyright © 2020 AsapInc. All rights reserved.
//

import UIKit

public var pOrC = 0 //if 1 it is PvC if 2 it is PvP

class ViewController: UIViewController {
    

    @IBOutlet var backgroundGradientView: UIView!
    
    
    
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
    }
        
    override var shouldAutorotate: Bool {
        return false
    }
    
    @IBAction func playerVSComputerTouched(_ sender: Any) {
        
        pOrC = 1
        
        performSegue(withIdentifier: "gametime", sender: self)
        
    }
    
    @IBAction func playerVSPlayerTouched(_ sender: Any) {
        
        pOrC = 2
        performSegue(withIdentifier: "gametime", sender: self)
        
    }
    
}


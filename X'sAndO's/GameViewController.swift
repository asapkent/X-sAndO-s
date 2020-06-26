//
//  GameViewController.swift
//  X'sAndO's
//
//  Created by Robert Jeffers on 6/25/20.
//  Copyright © 2020 AsapInc. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

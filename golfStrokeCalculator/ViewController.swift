//
//  ViewController.swift
//  golfStrokeCalculator
//
//  Created by Tiger Coder on 4/7/21.
//

import UIKit



class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Root View"
    }

    @IBAction func showFirstViewController(_ sender: Any) {
        performSegue(withIdentifier: "SegueToFirstVC", sender: self)
    }
    
    @IBAction func showInstructionsViewController(_ sender: Any) {
        performSegue(withIdentifier: "InstructionsSegue", sender: self)
    }
}


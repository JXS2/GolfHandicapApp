//
//  FirstViewController.swift
//  golfStrokeCalculator
//
//  Created by Tiger Coder on 4/8/21.
//

import UIKit

class FirstViewController: UIViewController {

    var playerData : [Player] = []
    @IBOutlet weak var indexTF: UITextField!
    @IBOutlet weak var fNTF: UITextField!
    @IBOutlet weak var lNTF: UITextField!
    @IBOutlet weak var addPlayersTV: UITableView!
    @IBOutlet weak var selectedplayerLabel: UILabel!
    @IBOutlet weak var playerInfoLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let add = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        let play = UIBarButtonItem(title: "Play", style: .plain, target: self, action: #selector(playTapped))

            navigationItem.rightBarButtonItems = [add, play]
        // Do any additional setup after loading the view.
    }
    

    @objc func addTapped() -> Void {
        if double(from: indexTF) != 0 {
            //alert here
            self.playerData.append(Player.init(index: double(from: indexTF), strokes: 0, fN: fNTF.text!, lN: lNTF.text!))
            self.addPlayersTV.performBatchUpdates({self.addPlayersTV.insertRows(at: [IndexPath(row: self.playerData.count - 1, section: 0)], with: .automatic)
        }, completion: nil)
            //self.addPlayersTV.reloadData()
            indexTF.text?.removeAll()
            lNTF.text?.removeAll()
            fNTF.text?.removeAll()
        } else {
            let alertSet = UIAlertController(title: "Invalid Index Input.", message: "Please check the directions and make sure your input is valid.", preferredStyle: .alert)
            self.present(alertSet, animated: true)
        }
        
        //create new editable tableviewcell
    }

    @objc func playTapped() -> Void {
        //next page
        performSegue(withIdentifier: "SecondViewControllerSegue", sender: self)
    }
}


func integer(from textField: UITextField) -> Int {
    guard let text = textField.text, let number = Int(text) else {
        return 0
    }
    return number
}

func double(from textField: UITextField) -> Double {
    guard let text = textField.text, let number = Double(text) else {
        return 0
    }
    return number
}



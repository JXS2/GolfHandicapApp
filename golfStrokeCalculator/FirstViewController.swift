//
//  FirstViewController.swift
//  golfStrokeCalculator
//
//  Created by Tiger Coder on 4/8/21.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playerData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell")!
        cell.textLabel?.text = (playerData[indexPath.row].name1 + "   " + playerData[indexPath.row].name2 + "     " + String(playerData[indexPath.row].index))
            return cell
        
    }
    

    var playerData : [Player] = [Player.init(index: 10.0, fN: "Jaiden", lN: "Schraut")]
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

        addPlayersTV.delegate = self
        addPlayersTV.dataSource = self
            navigationItem.rightBarButtonItems = [add, play]
        // Do any additional setup after loading the view.
    }
    

    @objc func addTapped() -> Void {
        if double(from: indexTF) != 0 {
            //alert here
            self.playerData.append(Player.init(index: double(from: indexTF), fN: fNTF.text!, lN: lNTF.text!))
            //self.addPlayersTV.performBatchUpdates({self.addPlayersTV.insertRows(at: [IndexPath(row: self.playerData.count - 1, section: 0)], with: .automatic)
            
        //}, completion: nil)
        
            self.addPlayersTV.reloadData()
            indexTF.text?.removeAll()
            lNTF.text?.removeAll()
            fNTF.text?.removeAll()
        } else {
            let alertSet = UIAlertController(title: "Invalid Index Input.", message: "Please check the directions and make sure your input is valid.", preferredStyle: .alert)
            let action = UIAlertAction(
                                title: "Ok",
                                style: .default,
                                handler: nil)
                   
                    alertSet.addAction(action)
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



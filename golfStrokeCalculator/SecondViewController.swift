//
//  SecondViewController.swift
//  golfStrokeCalculator
//
//  Created by Tiger Coder on 4/9/21.
//

import UIKit

class SecondViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    var pickerData : [Player] = [Player]()
    var pickerDataInfo: [String] = [String]()
   /*
    var pickerDataNames: [String] = [String]()
    var pickerDataIndex : [String] = [String]()
    var pickerDataLNames : [String] = [String]()
 */
    @IBOutlet weak var picker: UIPickerView!
    
    override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    internal func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
            return pickerDataInfo[row]
        }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            // This method is triggered whenever the user makes a change to the picker selection.
            // The parameter named row and component represents what was selected.
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let vc = FirstViewController()
        pickerData = vc.playerData
        for player in pickerData {
            pickerDataInfo.append(player.name1 + player.name2 + String(player.index))
        }
        /*
        pickerDataInfo.append(pickerDataNames)
        pickerDataInfo.append(pickerDataLNames)
        pickerDataInfo.append(pickerDataIndex)
        
        */
        
        
        
        // Do any additional setup after loading the view.
        self.picker.delegate = self
        self.picker.dataSource = (self.pickerDataInfo as! UIPickerViewDataSource)
        //check this
        
    }
    
    
    
    @IBAction func playerSelect(_ sender: UIButton) {
        
    }
    
    
    
    @IBAction func confirmPlayers(_ sender: UIButton) {
        performSegue(withIdentifier: "ThirdViewControllerSegue", sender: self)
    
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

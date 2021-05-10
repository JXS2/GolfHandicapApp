//
//  SecondViewController.swift
//  golfStrokeCalculator
//
//  Created by Tiger Coder on 4/9/21.
//

import UIKit

class SecondViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITableViewDelegate, UITableViewDataSource {
    let v1 : FirstViewController = FirstViewController()
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return v1.playerData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell")!
        cell.textLabel?.text = v1.playerData[indexPath.row].name1
        return cell
       
    }
    
    var pickerData : [Player] = [Player]()
    var selectedData = [Player]()
    var pickerDataInfo: [String] = [String]()
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var tableViewPlayers: UITableView!
    
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
        self.picker.dataSource = self.pickerDataInfo as? UIPickerViewDataSource
        self.tableViewPlayers.delegate = self
        self.tableViewPlayers.dataSource = self.selectedData as? UITableViewDataSource
        //check this
        
    }
    
    func selectedRow(inComponent component: Int) -> Int {
        return component
    }
    
    @IBAction func playerSelect(_ sender: UIButton) {
        //Find selected pickerwivew cell object
        // add player to separate array and display array on tableview
        let selectedValue = pickerData[picker.selectedRow(inComponent: 0)]
        selectedData.append(selectedValue)
        tableViewPlayers.reloadData()
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

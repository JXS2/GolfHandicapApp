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
        return selectedData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell")!
        cell.textLabel?.text = selectedData[indexPath.row]
        return cell
       
    }
    
    var pickerData : [Player] = [Player]()
    var selectedData = [String]()
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
        return pickerDataInfo.count
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
        
        for player in pickerData {
            pickerDataInfo.append(player.name1 + " " + player.name2)
        }
        print(pickerDataInfo)
        /*
        pickerDataInfo.append(pickerDataNames)
        pickerDataInfo.append(pickerDataLNames)
        pickerDataInfo.append(pickerDataIndex)
        
        */
        
        
        
        // Do any additional setup after loading the view.
        self.picker.delegate = self
        self.picker.dataSource = self
        self.tableViewPlayers.delegate = self
        self.tableViewPlayers.dataSource = self
        //check this
        
    }
    
    func selectedRow(inComponent component: Int) -> Int {
        return component
    }
    
    @IBAction func playerSelect(_ sender: UIButton) {
       // NEED - Hide player after chosen on pickerview
        let selectedValue = pickerData[picker.selectedRow(inComponent: 0)]
        print(selectedValue.name1)
        var index = 0
        for data in pickerData{
            if( data === selectedValue){
                break
            }
            index+=1
        }
        selectedData.append(selectedValue.name1 + "    " + selectedValue.name2 + "     " + String(selectedValue.index))
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



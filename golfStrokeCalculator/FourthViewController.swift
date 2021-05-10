//
//  FourthViewController.swift
//  golfStrokeCalculator
//
//  Created by Tiger Coder on 4/12/21.
//

import UIKit

class FourthViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableViewResults: UITableView!
    let v3 = ThirdViewController()
    let v1 = FirstViewController()
    var displayC1Name : [String] = []
    var displayC3Handicap : [Double] = []
    //113 is consdiered standard course difficulty rating
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell")!
        cell.textLabel?.text = v1.playerData[indexPath.row].name1
        return cell
    }
    

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //for player in  {
            
        //}
        
        let selectedCourse : TeeBox = v3.courseChosen
        var dc : Double
        for player in v1.playerData {
            displayC1Name.append(player.name1 + " " + player.name2)
            
            //find handicap
            dc = (player.index * (selectedCourse.slope / 113)) + (selectedCourse.rating - Double(selectedCourse.par))
            displayC3Handicap.append(dc)
            
        }
        self.tableViewResults.reloadData()
        // Do any additional setup after loading the view.
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

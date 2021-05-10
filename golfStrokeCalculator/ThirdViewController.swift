//
//  ThirdViewController.swift
//  golfStrokeCalculator
//
//  Created by Tiger Coder on 4/12/21.
//

import UIKit

class ThirdViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITableViewDelegate, UITableViewDataSource {
    
    var courseDataArray = CourseData.init()
    var courseDataSearchArray = CourseData.init()
    var courseChosen = TeeBox.init(s: 0, nm: "", r: 1.0, p: 72)
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 1
    }
    
    
    let v1 = FirstViewController()
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        //return
   // }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return v1.playerData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell")!
        cell.textLabel?.text = v1.playerData[indexPath.row].name1
        return cell
    }
    

    
    @IBOutlet weak var confirmCourse: UIButton!
    @IBOutlet weak var searchTF: UITextField!
    @IBOutlet weak var holePicker: UIPickerView!
    @IBOutlet weak var coursesOptions: UITableView!
    @IBOutlet weak var confirmLocBTN: UIButton!
    


    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        holePicker.isHidden = true
        confirmCourse.isHidden = true
        confirmLocBTN.isHidden = true
        self.coursesOptions.dataSource = self
        self.coursesOptions.delegate = self
        
        
        
        // Do any additional setup after loading the view.
        var courseNames : [String] = courseDataArray.getCourseList()
    }
    
    
    @IBAction func confirmCourse(_ sender: UIButton) {
        //unhide second pickerview and initialise data
        
    }
    
    

    @IBAction func confirmLocation(_ sender: UIButton) {
        performSegue(withIdentifier: "FourthViewControllerSegue", sender: self)
        
    }
    
    //Search courses function utilizing user input from the textfield. Uses substring in order to match
    
    @IBAction func confirmTFBTN(_ sender: UIButton) {
        var outputArray : [Course] = []
        if searchTF.text!.count >= 3 {
            let input : String? = (searchTF.text)
            for course in courseDataArray.courses {
                let courseSearch = course.name.prefix(input!.count)
                if courseSearch == input ?? "" {
                    outputArray.append(course)
                }
            }
        }
        
        self.coursesOptions.reloadData()
        
       
        
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

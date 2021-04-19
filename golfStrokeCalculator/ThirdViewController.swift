//
//  ThirdViewController.swift
//  golfStrokeCalculator
//
//  Created by Tiger Coder on 4/12/21.
//

import UIKit

class ThirdViewController: UIViewController {

    
    @IBOutlet weak var confirmCourse: UIButton!
    @IBOutlet weak var searchTF: UITextField!
    @IBOutlet weak var holePicker: UIPickerView!
    @IBOutlet weak var coursesOptions: UITableView!
    @IBOutlet weak var confirmLocBTN: UIButton!
    
    let cData : CourseData = CourseData.init()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        holePicker.isHidden = true
        confirmCourse.isHidden = true
        confirmLocBTN.isHidden = true
        
        // Do any additional setup after loading the view.
        var courseNames : [String] = cData.getCourseList()
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
        
        //figure out which courses to show
        let input : String? = (searchTF.text)
        for course in cData.courses {
            let courseSearch = course.name.prefix(input!.count)
            if courseSearch == input ?? "" {
                outputArray.append(course)
            }
        }
        
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

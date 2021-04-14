//
//  Course.swift
//  golfStrokeCalculator
//
//  Created by Tiger Coder on 4/7/21.
//

import Foundation

class Course {
    var Teeboxes : [String] = []
    var rating = 0.0
    var par = 0
    var name = ""
    
    init(TBs : [String], r : Double, p : Int, cN: String) {
        Teeboxes = TBs
        rating = r
        par = p
        name = cN
    }
    
    
    
    
}

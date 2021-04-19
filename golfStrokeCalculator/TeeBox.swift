//
//  TeeBox.swift
//  golfStrokeCalculator
//
//  Created by Tiger Coder on 4/7/21.
//

import Foundation

class TeeBox {
    var slope = 0.0
    var name : String = ""
    var rating = 0.0
    var par = 0
    
    
    init(s : Double, nm : String, r : Double, p : Int) {
        slope = s
        name = nm
        rating = r
        par = p
    }
    
    
    
}

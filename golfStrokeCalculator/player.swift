//
//  Player.swift
//  golfStrokeCalculator
//
//  Created by Tiger Coder on 4/7/21.
//

import Foundation

class Player {
    var index = 0.0
    var name1 = ""
    var name2 = ""
    
    init(index: Double, fN : String, lN : String) {
        self.index = index
        name1 = fN
        name2 = lN
    }
    
}


//
//  TableViewCell.swift
//  golfStrokeCalculator
//
//  Created by Tiger Coder on 4/12/21.
//

import Foundation
import UIKit
protocol CellDelegate: class {
    func cellBtnTapped(tag: Int)
}
class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var btn : UIButton!
    weak var delegate: CellDelegate?
    
    
    
}

//
//  GenderCell.swift
//  CursoiOSAdvanced
//
//  Created by Dev2 on 24/10/2019.
//  Copyright © 2019 clasegetafe. All rights reserved.
//

import UIKit

class GenderCell: UITableViewCell {
    static let cellIdentifier = String(describing: GenderCell.self)
    static let cellHeight: CGFloat = 112
    
    @IBOutlet weak var mView: UIView!

    @IBOutlet weak var genderOptions: UISegmentedControl!
    @IBOutlet weak var mLabel: UILabel!
    
    
    @IBAction func onGenderPressed(_ sender: UISegmentedControl) {
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    

  
}





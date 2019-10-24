//
//  BirthdateCell.swift
//  CursoiOSAdvanced
//
//  Created by Dev2 on 24/10/2019.
//  Copyright © 2019 clasegetafe. All rights reserved.
//

import UIKit

class BirthdateCell: UITableViewCell {
    static let cellIdentifier = String(describing: BirthdateCell.self)
    
    @IBOutlet weak var mView: UIView!
    @IBOutlet weak var mLabel: UILabel!
    @IBOutlet weak var mDatePicker: UIDatePicker!
}

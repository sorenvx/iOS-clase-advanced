//
//  EmailCell.swift
//  CursoiOSAdvanced
//
//  Created by Dev2 on 24/10/2019.
//  Copyright © 2019 clasegetafe. All rights reserved.
//

import UIKit

class EmailCell: UITableViewCell {
    static let cellIdentifier = String(describing: EmailCell.self)
    
    @IBOutlet weak var mView: UIView!
    @IBOutlet weak var mLabel1: UILabel!
    @IBOutlet weak var mFieldText1: UITextField!
    @IBOutlet weak var mLabel2: UILabel!
    @IBOutlet weak var mFieldText2: UITextField!
    @IBOutlet weak var mLabel3: UILabel!
    @IBOutlet weak var mFieldText3: UITextField!
}

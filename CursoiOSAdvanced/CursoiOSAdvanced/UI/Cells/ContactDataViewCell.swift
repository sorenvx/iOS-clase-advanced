//
//  ContactDataViewCell.swift
//  CursoiOSAdvanced
//
//  Created by Dev2 on 16/10/2019.
//  Copyright © 2019 clasegetafe. All rights reserved.
//

import UIKit

class ContactDataViewCell: UITableViewCell {
     static let cellIdentifier = String(describing: ContactDataViewCell.self)
    
    
    @IBOutlet weak var mViewCell: UIView!
    @IBOutlet weak var mLabelCell: UILabel!
    @IBOutlet weak var mLabelCell2: UILabel!
    @IBOutlet weak var mLabelCell3: UILabel!
    @IBOutlet weak var mLabelCell4: UILabel!
    
    
    override func prepareForReuse() {
        mLabelCell2.text = nil
        mLabelCell3.text = nil
        mLabelCell4.text = nil
        // MUY IMPORTANTE
    }
    
    func configureCell(email: String? = nil, phone: String?, street: String? = nil) {
             mLabelCell2.text = email
             mLabelCell3.text = phone
             mLabelCell4.text = street
    }
}

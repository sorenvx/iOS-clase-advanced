//
//  NameCell.swift
//  CursoiOSAdvanced
//
//  Created by Dev2 on 24/10/2019.
//  Copyright © 2019 clasegetafe. All rights reserved.
//

import UIKit

class NameCell: UITableViewCell {
     static let cellIdentifier = String(describing: NameCell.self)
    static let cellHeight: CGFloat = 165
    
    @IBOutlet weak var mView: UIView!
    @IBOutlet weak var mImage: UIImageView!
    @IBOutlet weak var mLabel1: UILabel!
    @IBOutlet weak var mFieldText1: UITextField!
    @IBOutlet weak var mLabel2: UILabel!
    @IBOutlet weak var mFieldText2: UITextField!
    
    override func prepareForReuse() {
        mImage.image = nil
        mFieldText1.text = nil
        mFieldText2.text = nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onImageTap))
        
        
        mImage.addGestureRecognizer(tapGesture)
    }
    
    @objc func onImageTap() {
        
    }
    
}

extension NameCell: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

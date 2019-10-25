//
//  NationalityCollectionViewCell.swift
//  CursoiOSAdvanced
//
//  Created by Dev2 on 24/10/2019.
//  Copyright © 2019 clasegetafe. All rights reserved.
//

import UIKit

class NationalityCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier = String(describing: NationalityCollectionViewCell.self)
    
    
    @IBOutlet weak var mView: UIView!
    @IBOutlet weak var mLabel: UILabel!
    
    override func awakeFromNib() {
           super.awakeFromNib()
           let tap = UITapGestureRecognizer(target: self, action: #selector(NationalityCollectionViewCell.tapFunction))
           mView.isUserInteractionEnabled = true
           mView.addGestureRecognizer(tap)
       }
       
       @IBAction func tapFunction(sender: UITapGestureRecognizer) {
           print("tap working")
        mView.backgroundColor = UIColor.systemTeal
       }
    
}

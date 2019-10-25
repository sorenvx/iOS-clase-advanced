//
//  GenderCollectionViewCell.swift
//  CursoiOSAdvanced
//
//  Created by Dev2 on 24/10/2019.
//  Copyright © 2019 clasegetafe. All rights reserved.
//

import UIKit

class GenderCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = String(describing: GenderCollectionViewCell.self)
    
    
    @IBOutlet weak var mView: UIView!
    @IBOutlet weak var mLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(GenderCollectionViewCell.tapFunction))
        mView.isUserInteractionEnabled = true
        mView.addGestureRecognizer(tap)
    }
    
    @IBAction func tapFunction(sender: UITapGestureRecognizer) {
        print("tap working")
        mLabel.textColor = UIColor.brown
    }
}

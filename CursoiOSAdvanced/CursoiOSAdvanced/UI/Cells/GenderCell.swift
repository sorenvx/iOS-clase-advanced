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
    
    @IBOutlet weak var mView: UIView!
    @IBOutlet weak var mCollectionView: UICollectionView!
    @IBOutlet weak var mLabel: UILabel!
    
}

//
//  CountryViewCell.swift
//  CursoiOSAdvanced
//
//  Created by Dev2 on 16/10/2019.
//  Copyright © 2019 clasegetafe. All rights reserved.
//

import UIKit

class CountryViewCell: UITableViewCell {
     static let cellIdentifier = String(describing: CountryViewCell.self)
    
    
    @IBOutlet weak var mViewCell: UIView!
    @IBOutlet weak var mImageViewCell: UIImageView!
    @IBOutlet weak var mLabelCell: UILabel!
    
    override func prepareForReuse() {
        //preparar la celda para volverla a utilizar. SIEMPRE hay que añadirla
        mImageViewCell.image = nil
        mLabelCell.text = nil
        
        // MUY IMPORTANTE
    }
    
    func configureCell(country: String? = nil, flag: String? = nil) {
        mLabelCell.text = country
        mImageViewCell.image = UIImage(named: "flag")
    }
}

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
     @IBOutlet weak var mLabelCell2: UILabel!
    @IBOutlet weak var mLabelCell: UILabel!
    
    override func prepareForReuse() {
        //preparar la celda para volverla a utilizar. SIEMPRE hay que añadirla
        
        mLabelCell.text = nil
        mLabelCell2.text = nil
        
        // MUY IMPORTANTE
    }
    
    func configureCell(country: String? = nil, nationality: String? = nil) {
        mLabelCell.text = country
        

        func flag(nat: String) -> String {
            guard let countryISO = nationality else {
                return ""
            }
            let base : UInt32 = 127397
            var s = ""
            for v in countryISO.unicodeScalars {
                s.unicodeScalars.append(UnicodeScalar(base + v.value)!)
            }
            return String(s)
        }
        mLabelCell2.text = flag(nat: nationality!)
    }
}

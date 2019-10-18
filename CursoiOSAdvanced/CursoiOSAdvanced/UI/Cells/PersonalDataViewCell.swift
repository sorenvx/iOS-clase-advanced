//
//  PersonalDataViewCell.swift
//  CursoiOSAdvanced
//
//  Created by Dev2 on 16/10/2019.
//  Copyright © 2019 clasegetafe. All rights reserved.
//

import UIKit

class PersonalDataViewCell: UITableViewCell {
    static let cellIdentifier = String(describing: PersonalDataViewCell.self)
       
    @IBOutlet weak var mViewCell: UIView!
    @IBOutlet weak var mImageViewCell: UIImageView!
    @IBOutlet weak var mLabelCell: UILabel!
    @IBOutlet weak var mLabelCell2: UILabel!
    @IBOutlet weak var mLabelCell3: UILabel!
    @IBOutlet weak var mLabelCell4: UILabel!
    @IBOutlet weak var mLabelCell5: UILabel!
       
    override func prepareForReuse() {
        //preparar la celda para volverla a utilizar. SIEMPRE hay que añadirla
        mImageViewCell.image = nil
        mLabelCell.text = nil
        mLabelCell2.text = nil
        mLabelCell3.text = nil
        mLabelCell4.text = nil
        mLabelCell5.text = nil
        
        // MUY IMPORTANTE
    }
       
       override  func awakeFromNib() {
           super.awakeFromNib() //cuando la vista se carga por primera vez.
           mImageViewCell.layer.cornerRadius = 30.0 // las esquinas redondas
//           viewDetailViewCell.configureShadow()
//           viewDetailViewCellFooter.layer.cornerRadius = 0
//           viewDetailViewCellFooter.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
       }
       
    func configureCell(image: String? = nil, name: String?, gender: String? = nil, birthdate: Date? = nil, lastName: String? = nil, city: String? = nil) {
            let url = URL(string: image ?? "")
            
            mLabelCell.text = name
            mLabelCell2.text = lastName
            mLabelCell3.text = city
            mLabelCell4.text = gender
        
            mImageViewCell.kf.setImage(with: url)
            if let birthdateValue = birthdate {
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "dd MMM,yyyy"
                mLabelCell5.text = dateFormatter.string(from: birthdateValue)
            }
        }
}

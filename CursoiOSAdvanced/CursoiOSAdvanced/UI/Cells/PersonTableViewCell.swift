//
//  PersonTableViewCell.swift
//  CursoiOSAdvanced
//
//  Created by Dev2 on 03/10/2019.
//  Copyright © 2019 clasegetafe. All rights reserved.
//

import UIKit
import Kingfisher


class PersonTableViewCell: UITableViewCell {

    
    static let cellIdentifier = String(describing: PersonTableViewCell.self)
    
    @IBOutlet weak var viewPersonViewCell: UIView!
    @IBOutlet weak var imagePersonViewCell: UIImageView!
    @IBOutlet weak var labelPersonViewCell: UILabel!
    @IBOutlet weak var labelPersonViewCell2: UILabel!
    @IBOutlet weak var labelPersonViewCell3: UILabel!
    @IBOutlet weak var labelPersonViewCell4: UILabel!
    
    override func prepareForReuse() {
        //preparar la celda para volverla a utilizar. SIEMPRE hay que añadirla
        imagePersonViewCell.image = nil
        labelPersonViewCell.text = nil
        labelPersonViewCell2.text = nil
        labelPersonViewCell3.text = nil
        labelPersonViewCell4.text = nil
        
        // MUY IMPORTANTE
    }
    override func awakeFromNib() {
        super.awakeFromNib() //cuando la vista se carga por primera vez.
        viewPersonViewCell.layer.cornerRadius = 20.0 // las esquinas redondas
        viewPersonViewCell.configureShadow()
        viewPersonViewCell.configureShadow(color: UIColor.white)
        imagePersonViewCell.layer.cornerRadius = imagePersonViewCell.frame.width / 2
    }
    
    //hay que crear una funcion para configurar las listas
    func configureCell(image: String? = nil, name: String?, email: String? = nil, birthdate: Date? = nil, nationality: String? = nil) {
        let url = URL(string: image ?? "")
        
        labelPersonViewCell.text = name
        labelPersonViewCell2.text = email
        labelPersonViewCell4.text = nationality
        imagePersonViewCell.kf.setImage(with: url)
        if let birthdateValue = birthdate {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd MMM,yyyy"
            labelPersonViewCell3.text = dateFormatter.string(from: birthdateValue)
        }
    }
}



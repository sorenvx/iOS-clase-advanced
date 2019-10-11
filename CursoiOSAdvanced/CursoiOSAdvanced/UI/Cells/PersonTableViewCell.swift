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
    
    override func prepareForReuse() {
        //preparar la celda para volverla a utilizar. SIEMPRE hay que añadirla
        imagePersonViewCell.image = nil
        labelPersonViewCell.text = nil
        labelPersonViewCell2.text = nil
        // MUY IMPORTANTE
    }
    override func awakeFromNib() {
        super.awakeFromNib() //cuando la vista se carga por primera vez.
        viewPersonViewCell.layer.cornerRadius = 20.0 // las esquinas redondas
        viewPersonViewCell.configureShadow()
        viewPersonViewCell.configureShadow(color: UIColor.green)
    }
    
    //hay que crear una funcion para configurar las listas
    func configureCell(image: String? = nil, name: String?, email: String? = nil) {
        let url = URL(string: image ?? "")
        labelPersonViewCell.text = name
        labelPersonViewCell2.text = email
        imagePersonViewCell.kf.setImage(with: url)
    }
}



//
//  PersonCollectionViewCell.swift
//  CursoiOSAdvanced
//
//  Created by Dev2 on 03/10/2019.
//  Copyright © 2019 clasegetafe. All rights reserved.
//
import UIKit

class PersonCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier = String(describing: PersonCollectionViewCell.self)
    
    @IBOutlet weak var viewDetailViewCell: UIView!
    @IBOutlet weak var viewDetailViewCellFooter: UIView!
    @IBOutlet weak var imageDetailtViewCell: UIImageView!
    @IBOutlet weak var labelDetailViewCell: UILabel!

    
    override func prepareForReuse() {
        //preparar la celda para volverla a utilizar. SIEMPRE hay que añadirla
        imageDetailtViewCell.image = nil
        labelDetailViewCell.text = nil
        // MUY IMPORTANTE
    }
    
    override  func awakeFromNib() {
        super.awakeFromNib() //cuando la vista se carga por primera vez.
        viewDetailViewCell.layer.cornerRadius = 8.0 // las esquinas redondas
        viewDetailViewCell.configureShadow()
        viewDetailViewCellFooter.layer.cornerRadius = 8.0
        viewDetailViewCellFooter.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
    }
    
     //hay que crear una funcion para configurar las listas
    func configureCell(title: String? = nil, image: String? = nil) {
        labelDetailViewCell.text = title
        imageDetailtViewCell.image = UIImage(named: image ?? "")
    }

}

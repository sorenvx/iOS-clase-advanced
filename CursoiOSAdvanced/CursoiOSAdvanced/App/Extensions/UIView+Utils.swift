//
//  UIView+Utils.swift
//  CursoiOSAdvanced
//
//  Created by Dev2 on 03/10/2019.
//  Copyright © 2019 clasegetafe. All rights reserved.
//

import UIKit


extension UIView {
    func configureShadow(color: UIColor = UIColor.lightGray,
                         opacity: Float = 0.6,
                         radius: CGFloat = 4.0,
                         offset: CGSize = CGSize.zero) {
        
        self.layer.shadowColor = color.cgColor // el color de la sombra
        self.layer.shadowOffset = offset // desde donde empieza la sombra
        self.layer.shadowOpacity = opacity
        self.layer.shadowRadius = radius
    }
}

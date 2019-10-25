//
//  CoordinatesCell.swift
//  CursoiOSAdvanced
//
//  Created by Dev2 on 24/10/2019.
//  Copyright © 2019 clasegetafe. All rights reserved.
//

import UIKit
import MapKit

class CoordinatesCell: UITableViewCell {
    static let cellIdentifier = String(describing: CoordinatesCell.self)
    static let cellHeight: CGFloat = 275
    
    @IBOutlet weak var mView: UIView!
    @IBOutlet weak var mLabel1: UILabel!
    @IBOutlet weak var mTextField1: UITextField!
    @IBOutlet weak var mLabel2: UILabel!
    @IBOutlet weak var mTextField2: UITextField!
    @IBOutlet weak var mMap: MKMapView!
    
    
}

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
    
    private let regionRadius: CLLocationDistance = 10_000
    
    override func prepareForReuse() {
           mTextField1.text = nil
           mTextField2.text = nil
       }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        mTextField1.delegate = self
        mTextField2.delegate = self
        
    }
    
    private func centerMapOn(location: CLLocation) {
        mMap.setRegion(MKCoordinateRegion(center: location.coordinate,
                                             latitudinalMeters: regionRadius,
                                             longitudinalMeters: regionRadius),
                                                animated: true)
    }
}


extension CoordinatesCell: UITextFieldDelegate {
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if (!mTextField1.text!.isEmpty && mTextField2.text!.isEmpty) {
            
            let currentLocation = CLLocation(latitude: Double(mTextField1.text!) ?? 0, longitude: Double(mTextField2.text!) ?? 0)
            
            centerMapOn(location: currentLocation)
        }
        return false
    }
}

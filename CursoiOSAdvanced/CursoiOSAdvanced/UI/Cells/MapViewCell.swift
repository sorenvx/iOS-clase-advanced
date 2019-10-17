//
//  MapViewCell.swift
//  CursoiOSAdvanced
//
//  Created by Dev2 on 16/10/2019.
//  Copyright © 2019 clasegetafe. All rights reserved.
//

import UIKit
import MapKit

class MapViewCell: UITableViewCell {
    static let cellIdentifier = String(describing: MapViewCell.self)
    
    @IBOutlet weak var mViewCell: UIView!
    
    @IBOutlet weak var mapView: MKMapView!
    
//    func maps() {
//        // set initial location in Honolulu
//        let initialLocation = CLLocation(latitude: 21.282778, longitude: -157.829444)
//        let regionRadius: CLLocationDistance = 1000
//        func centerMapOnLocation(location: CLLocation) {
//            let coordinateRegion = MKCoordinateRegion(center: location.coordinate,
//                                                      latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
//            mapView.setRegion(coordinateRegion, animated: true)
//        }
//        
//        centerMapOnLocation(location: initialLocation)
//    }
    
    
    
    
}

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
    

    func map() {
       
    }
    
    func configureCell(latitude: String? = nil, longitude: String? = nil) {
        let location = CLLocationCoordinate2D(latitude: 21.283921,
                                              longitude: 0.1246402)
               
               // 2
               let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
               let region = MKCoordinateRegion(center: location, span: span)
                   mapView.setRegion(region, animated: true)
                   
               //3
               let annotation = MKPointAnnotation()
               annotation.coordinate = location
               annotation.title = "Big Ben"
               annotation.subtitle = "London"
               mapView.addAnnotation(annotation)
    }
    
}

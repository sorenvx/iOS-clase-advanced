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
    
    private let regionRadius: CLLocationDistance = 10_000
    private let barcelonaLocation = CLLocation(latitude: 41.381653, longitude: 2.123764)
    private let madridLocation = CLLocation(latitude: 40.416775, longitude: -3.703790)
    
    
    override func prepareForReuse() {
        mapView.delegate = nil
    }
    
    override func awakeFromNib() {
        mapView.delegate = self
    }
    
    
    func configureCell(latitude: String? = nil, longitude: String? = nil) {
        guard let locationLatitude = Double(latitude ?? ""),
            let locationLongitude = Double(longitude ?? "") else {
                return
        }
        
        let userLocation = CLLocation(latitude: locationLatitude, longitude: locationLongitude)
//        centerMapOn(location: userLocation)
        mapView.mapType = .standard
        showRouteOnMap(originCoordinates: madridLocation.coordinate, destinationCoordinates: barcelonaLocation.coordinate)
        
        
    }
    private func centerMapOn(location: CLLocation) {
        mapView.setRegion(MKCoordinateRegion(center: barcelonaLocation.coordinate,
                                             latitudinalMeters: regionRadius,
                                             longitudinalMeters: regionRadius),
                          animated: true)
    }
    private func addUserMark(location: CLLocation) {
        mapView.addAnnotation(UserMarkAnnotation(title: "username", locationName: "calle, cp, ciudad, pais", coordinate: location.coordinate))
    }
    
    
}



class UserMarkAnnotation: NSObject, MKAnnotation {
    let title: String?
    let locationName: String?
    let coordinate: CLLocationCoordinate2D
    
    init(title: String, locationName: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.locationName = locationName
        self.coordinate = coordinate
    }
}


extension MapViewCell: MKMapViewDelegate {
    
    
    func showRouteOnMap(originCoordinates: CLLocationCoordinate2D,
                        destinationCoordinates: CLLocationCoordinate2D) {
        let originPlaceMark = MKPlacemark(coordinate: originCoordinates, addressDictionary: nil)
        let destinationPlaceMark = MKPlacemark(coordinate: destinationCoordinates, addressDictionary: nil)
        
        addAnnotationPlacemarks(origin: originPlaceMark, destination: destinationPlaceMark)
        let directionsRequest = directions(from: MKMapItem(placemark: originPlaceMark), to: MKMapItem(placemark: destinationPlaceMark))
        calculateDirections(request: directionsRequest)
    }
    
    
    private func addAnnotationPlacemarks(origin: MKPlacemark, destination: MKPlacemark) {
        let originAnnotation = MKPointAnnotation()
        originAnnotation.coordinate = origin.coordinate
        let destinationAnnotation = MKPointAnnotation()
        destinationAnnotation.coordinate = destination.coordinate
        
        mapView.showAnnotations([originAnnotation, destinationAnnotation], animated: true)
    }
    
    private func directions(from: MKMapItem, to: MKMapItem) -> MKDirections {
        let requestDirections = MKDirections.Request()
        requestDirections.source = from
        requestDirections.destination = to
        requestDirections.requestsAlternateRoutes = true
        requestDirections.transportType = .automobile
        
        return MKDirections(request: requestDirections)
    }
    
    private func calculateDirections(request: MKDirections) {
        guard !request.isCalculating else {
            return
        }
        request.calculate{ response, error in
            guard let responseData = response else {
                return
            }
//            let route = responseData.routes[0]
            responseData.routes.forEach{ self.mapView.addOverlay($0.polyline, level: .aboveRoads)}
//            self.mapView.addOverlay(route.polyline, level: .aboveRoads)
        }
    }
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.strokeColor = UIColor.blue
        renderer.lineWidth = 4.0
        
        return renderer
    }
}

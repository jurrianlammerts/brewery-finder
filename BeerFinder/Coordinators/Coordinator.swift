//
//  Coordinator.swift
//  BeerFinder
//
//  Created by Jurrian Lammerts on 04/03/2020.
//  Copyright © 2020 Jurrian Lammerts. All rights reserved.
//

import Foundation
import MapKit

// Coordinator class used to deal with UIKit
final class Coordinator: NSObject, MKMapViewDelegate {
    
    var control: MapView
    
    init(_ control: MapView){
        self.control = control
    }
        
    func mapView(_ mapView: MKMapView, didAdd views: [MKAnnotationView]) {
        if let annotationView = views.first {
            if let annotation = annotationView.annotation {
                
                if annotation is MKUserLocation {
                    
                    let region  = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: 5000000, longitudinalMeters: 5000000)
                    
                    mapView.setRegion(region, animated: true)
                }
                
            }
        }
    }
}

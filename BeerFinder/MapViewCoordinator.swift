//
//  MapViewCoordinator.swift
//  BeerFinder
//
//  Created by Jurrian Lammerts on 04/03/2020.
//  Copyright © 2020 Jurrian Lammerts. All rights reserved.
//

import Foundation
import MapKit

class MapViewCoordinator: NSObject, MKMapViewDelegate {
    var mapViewController: MapView
    
    init(_ control: MapView) {
        self.mapViewController = control
    }
    
    func mapView(_ mapView: MKMapView, viewFor
        annotation: MKAnnotation) -> MKAnnotationView?{
        //Custom View for Annotation
        let annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "customView")
        annotationView.canShowCallout = true
        //Your custom image icon
        annotationView.image = UIImage(named: "marker")
        return annotationView
    }
}

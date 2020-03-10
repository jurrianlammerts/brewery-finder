//
//  MapView.swift
//  BeerFinder
//
//  Created by Jurrian Lammerts on 02/03/2020.
//  Copyright © 2020 Jurrian Lammerts. All rights reserved.
//


import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    
    let breweries : [BreweryViewModel]
    let coordinate: CLLocationCoordinate2D
    @ObservedObject var settings = Settings.shared
    
    func makeUIView(context: Context) -> MKMapView{
        let map = MKMapView()
        map.showsUserLocation = true
        map.delegate = context.coordinator
        return map
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func centerMapOnLocation(_ location: CLLocationCoordinate2D, mapView: MKMapView) {
        let regionRadius: CLLocationDistance = 500000
        let coordinateRegion = MKCoordinateRegion(center: location, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    
    func updateUIView(_ view: MKMapView, context: Context){
        // Remove all annotations
        view.removeAnnotations(view.annotations)
        
        if(!self.settings.isGPSOn) {
            view.showsUserLocation = false
        } else {
            view.showsUserLocation = true
        }
        
        // Loop over all breweries and plot on map
        for brewery in breweries{
            let locations = brewery.locations.map { location ->  MKAnnotation in
                let annotation = MKPointAnnotation()
                annotation.title = location.name
                annotation.coordinate = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
                return annotation
            }
            view.addAnnotations(locations)
        }
        
        // Center map on User location
        centerMapOnLocation(coordinate, mapView: view)
    }
}


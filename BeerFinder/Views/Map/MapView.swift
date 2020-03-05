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
    
    func makeUIView(context: Context) -> MKMapView{
        let map = MKMapView()
//        map.setRegion()
        map.showsUserLocation = true
        map.delegate = context.coordinator
        return map
    }
    

    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func updateUIView(_ view: MKMapView, context: Context){
        for brewery in breweries    {
            let locations = brewery.locations.map { location ->  MKAnnotation in
                print(location)
                let annotation = MKPointAnnotation()
                annotation.title = location.name
                annotation.coordinate = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
                return annotation
            }
            view.addAnnotations(locations)
        }
    }
    
}

//
//  LocationManager.swift
//  BeerFinder
//
//  Created by Jurrian Lammerts on 04/03/2020.
//  Copyright © 2020 Jurrian Lammerts. All rights reserved.
//

import Foundation
import MapKit

// Updates views when location changes
class LocationManager: NSObject, ObservableObject {
    
    private let locationManager = CLLocationManager()
    @Published var location: CLLocation? = nil
    
    override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.distanceFilter = kCLDistanceFilterNone
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
    }
}

extension LocationManager: CLLocationManagerDelegate {
    
    // Update location variable when it changes
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        guard let location = locations.last else {
            return
        }
        
        self.location = location
    }
    
}

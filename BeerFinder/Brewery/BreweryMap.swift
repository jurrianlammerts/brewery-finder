//
//  BreweryMap.swift
//  BeerFinder
//
//  Created by Jurrian Lammerts on 04/03/2020.
//  Copyright © 2020 Jurrian Lammerts. All rights reserved.
//

import SwiftUI
import MapKit


struct BreweryMap: View {
    
    @ObservedObject private var breweryMapVM = BreweryMapViewModel()
    @ObservedObject private var locationManager = LocationManager()
    
    var body: some View {
        
        let userCoordinate = self.locationManager.location != nil ? self.locationManager.location!.coordinate: CLLocationCoordinate2D()
        
        return ZStack {
            MapView(breweries: self.breweryMapVM.breweries, center: userCoordinate)
        }.edgesIgnoringSafeArea(.top)
    }
}


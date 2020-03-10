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
    @ObservedObject var settings = Settings.shared
    @Binding var selection: Int
    
    @State private var showAlert: Bool = false
    
    var body: some View {
        
        // Coordinates of the User
        let coordinate = self.locationManager.location != nil ? self.locationManager.location!.coordinate: CLLocationCoordinate2D()
        
        return
            VStack {
                MapView(breweries: self.breweryMapVM.breweries, coordinate: coordinate)
            }
            .edgesIgnoringSafeArea(.top)
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Can't find your location"), message: Text("GPS needs to be turned on in order to find nearby breweries."),
                      primaryButton: .default (Text("OK")) {
                        self.pushToView()
                    },
                      secondaryButton: .cancel()
                )
            }
            .onAppear(perform: {
                self.showAlert = !self.settings.isGPSOn
            })
    }
    
    // Take user to SettingsView to change GPS settings
    func pushToView() {
        DispatchQueue.main.async {
            // 3 is the index of the SettingsView
            self.selection = 3
        }
    }
}


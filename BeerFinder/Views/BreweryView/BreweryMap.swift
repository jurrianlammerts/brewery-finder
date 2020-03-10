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
    @State private var isActive: Bool = false
    
    var body: some View {
        
        let coordinate = self.locationManager.location != nil ? self.locationManager.location!.coordinate: CLLocationCoordinate2D()
        
        return
            
            VStack {
                // Hidden link to SettingsView
                NavigationLink(destination: SettingsView(), isActive: self.$isActive) {
                    EmptyView()
                }.hidden()
                
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
    
    func pushToView() {
        DispatchQueue.main.async {
            self.isActive = true
            self.selection = 3
        }
    }
}


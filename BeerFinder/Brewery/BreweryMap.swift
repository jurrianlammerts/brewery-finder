//
//  BreweryMap.swift
//  BeerFinder
//
//  Created by Jurrian Lammerts on 04/03/2020.
//  Copyright © 2020 Jurrian Lammerts. All rights reserved.
//

import SwiftUI

struct BreweryMap: View {
    
    @ObservedObject private var breweryMapVM = BreweryMapViewModel()
    
    var body: some View {
        MapView(breweries: self.breweryMapVM.breweries)
            .edgesIgnoringSafeArea(.top)
        
    }
}


//
//  BreweryList.swift
//  BeerFinder
//
//  Created by Jurrian Lammerts on 02/03/2020.
//  Copyright © 2020 Jurrian Lammerts. All rights reserved.
//

import SwiftUI

struct BreweryList: View {
    var body: some View {
        NavigationView {
            List(breweryData) { brewery in
                NavigationLink(destination: BreweryDetail(brewery: brewery)) {
                    BreweryRow(brewery: brewery)
                }
            }
            .navigationBarTitle(Text("Breweries"))
        }
    }
}

struct BreweryList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE", "iPhone XS Max"], id: \.self) { deviceName in
            BreweryList()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}


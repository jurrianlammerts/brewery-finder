//
//  GPSView.swift
//  BeerFinder
//
//  Created by Jurrian Lammerts on 04/03/2020.
//  Copyright © 2020 Jurrian Lammerts. All rights reserved.
//

import SwiftUI
import Combine

struct GPSView: View {
    @ObservedObject var settings = Settings.shared
    
    var body: some View {
        return NavigationLink(destination: ToggleGPSView(settings: settings)) {
            HStack() {
                Text("GPS")
                    .foregroundColor(.blue)
                    .font(.system(size: 18))
                    .frame(width: 150,height: 40, alignment: .leading)
                Text(settings.isGPSOn ? "On" : "Off")
                    .foregroundColor(.gray)
                    .font(.system(size: 18))
                    .font(.subheadline)
                    .frame(width: 170, height: 40, alignment: .trailing)
            }
        }
    }
}


struct ToggleGPSView: View {
    @ObservedObject var settings: Settings
    
    var body: some View {
        Form {
            Section(header: Text("ENABLE TO FIND NEARBY BREWERIES")) {
                Toggle(isOn: $settings.isGPSOn) {
                    Text("GPS").font(.system(size: 18))
                }
            }
        }
    }
}

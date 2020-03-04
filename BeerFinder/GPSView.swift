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
    @ObservedObject var gps = Settings()
    
    var body: some View {
        return NavigationLink(destination: ToggleGPSView(gps: gps)) {
            HStack() {
                Image("default")
                    .resizable()
                    .cornerRadius(12)
                    .frame(width: 25, height: 25)
                    .clipped()
                    .aspectRatio(contentMode: .fit)
                Text("GPS")
                    .foregroundColor(.blue)
                    .font(.system(size: 20))
                    .frame(width: 150,height: 40, alignment: .leading)
                Text(gps.isGPSOn ? "On" : "Off")
                    .foregroundColor(.gray)
                    .font(.system(size: 20))
                    .font(.subheadline)
                    .frame(width: 170, height: 40, alignment: .trailing)
            }
        }
    }
}


struct ToggleGPSView: View {
    @ObservedObject var gps: Settings
    
    var body: some View {
        Form {
            Section(header: Text("ENABLE TO FIND NEARBY BREWERIES")) {
                Toggle(isOn: $gps.isGPSOn) {
                    Text("GPS").font(.system(size: 18))
                }
                
                if gps.isGPSOn {
                    HStack {
                        Text("Locating signal")
                            .foregroundColor(.gray)
                            .font(.system(size: 18))
                            .font(.system(.subheadline))
                        ActivityIndicator(style: .medium)
                    }
                }
            }
        }
    }
}

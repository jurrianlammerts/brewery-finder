//
//  SettingView.swift
//  BeerFinder
//
//  Created by Jurrian Lammerts on 03/03/2020.
//  Copyright © 2020 Jurrian Lammerts. All rights reserved.
//

import SwiftUI
import Combine

struct SettingsView : View {
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    GPSView()
                }
            }
            .navigationBarTitle("Settings")
        }
    }
}


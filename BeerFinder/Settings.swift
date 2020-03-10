//
//  Settings.swift
//  BeerFinder
//
//  Created by Jurrian Lammerts on 04/03/2020.
//  Copyright © 2020 Jurrian Lammerts. All rights reserved.
//

import Combine
import Foundation

class Settings: ObservableObject {
    
    // notify subscribed Views about changes
    var didChange = PassthroughSubject<Void, Never>()
    
    // Make a reference to this class
    static let shared = Settings()
    
    @Published var isGPSOn = false { didSet { updateGPS() } }
    
    init() {
        isGPSOn = UserDefaults.standard.bool(forKey: "gps")
    }
    
    // Toggle GPS setting
    func updateGPS() {
        UserDefaults.standard.set(isGPSOn, forKey: "gps")
    }
}




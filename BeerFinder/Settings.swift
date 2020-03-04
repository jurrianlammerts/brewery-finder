//
//  Settings.swift
//  BeerFinder
//
//  Created by Jurrian Lammerts on 04/03/2020.
//  Copyright © 2020 Jurrian Lammerts. All rights reserved.
//

import Combine

class Settings: ObservableObject {
    var didChange = PassthroughSubject<Void, Never>()
    
    @Published var isGPSOn = false { didSet { update() } }
    
    @Published var types = ["Off","On"]
    @Published var type = 0 { didSet { update() } }
    
    @Published var isToggleOn = false { didSet { update() } }
    
    func update() {
        didChange.send(())
    }
}




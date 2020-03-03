//
//  Brewery.swift
//  BeerFinder
//
//  Created by Jurrian Lammerts on 02/03/2020.
//  Copyright © 2020 Jurrian Lammerts. All rights reserved.
//

import SwiftUI
import CoreLocation

struct Brewery: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var description: String
    fileprivate var imageName: String
    fileprivate var coordinates: Coordinates
    var country: String
    var city: String

    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
}

extension Brewery {
    var image: Image {
        ImageStore.shared.image(name: imageName)
    }
}

struct Coordinates: Hashable, Codable {
    var latitude: Double
    var longitude: Double
}

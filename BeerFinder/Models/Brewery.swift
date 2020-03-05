//
//  Brewery.swift
//  BeerFinder
//
//  Created by Jurrian Lammerts on 02/03/2020.
//  Copyright © 2020 Jurrian Lammerts. All rights reserved.
//

import Foundation

struct Response: Codable {
    let currentPage, numberOfPages, totalResults: Int
    let data: [Brewery]
}

struct Brewery: Codable, Identifiable {
    let id, name: String
    let locations: [Location]?
}

struct Location: Codable {
    let id, name: String
    let latitude, longitude: Double
}

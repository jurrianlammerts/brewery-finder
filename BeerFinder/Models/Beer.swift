//
//  Beer.swift
//  BeerFinder
//
//  Created by Jurrian Lammerts on 03/03/2020.
//  Copyright © 2020 Jurrian Lammerts. All rights reserved.
//

import Foundation

struct Beer: Codable {
    var id: Int
    var name: String
    var description: String
    var image_url: URL
}


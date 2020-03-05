//
//  Landmark.swift
//  BeerFinder
//
//  Created by Jurrian Lammerts on 04/03/2020.
//  Copyright © 2020 Jurrian Lammerts. All rights reserved.
//

import Foundation
import MapKit

class Landmark: NSObject, MKAnnotation {
    let title: String?
    let coordinate: CLLocationCoordinate2D
    
    init(title: String?,
         coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.coordinate = coordinate
    }
    
    static func requestMockData()-> [Landmark]{
        return [
            Landmark(title: "Brouwerij Noordt",
                     coordinate: .init(latitude: 51.933141, longitude: 4.48698)),
            Landmark(title: "Brouwerij 't IJ",
                     coordinate: .init(latitude: 52.367412, longitude: 4.939937)),
            Landmark(title: "Tapperij de Eeuwige Jeugd",
                     coordinate: .init(latitude: 52.3616, longitude: 4.924641))
        ]
    }
}

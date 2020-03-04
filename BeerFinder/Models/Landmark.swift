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
    let subtitle: String?
    let coordinate: CLLocationCoordinate2D
    
    init(title: String?,
         subtitle: String?,
         coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
    }
    
    static func requestMockData()-> [Landmark]{
        return [
            Landmark(title: "Brouwerij Noordt",
                     subtitle:"De bieren van Brouwerij Noordt hebben een herkenbare stijl. Doordrinkbaar, maar niet zonder smaak, met een duidelijk profiel dat altijd de grondstoffen laat spreken.",
                     coordinate: .init(latitude: 51.933141, longitude: 4.48698)),
            Landmark(title: "Brouwerij 't IJ",
                     subtitle:"Brouwerij 't IJ is een Amsterdamse brouwerij waar uitsluitend speciaalbieren gebrouwen worden.",
                     coordinate: .init(latitude: 52.367412, longitude: 4.939937)),
            Landmark(title: "Tapperij de Eeuwige Jeugd",
                     subtitle:"We maken geen toverdrank waar je pardoes weer jong van wordt of grootste krachten van krijgt. Dat heb je allemaal ook niet nodig want je bent al een superheld.",
                     coordinate: .init(latitude: 52.3616, longitude: 4.924641))
        ]
    }
}

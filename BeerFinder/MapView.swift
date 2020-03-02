//
//  MapView.swift
//  BeerFinder
//
//  Created by Jurrian Lammerts on 02/03/2020.
//  Copyright © 2020 Jurrian Lammerts. All rights reserved.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }

    func updateUIView(_ view: MKMapView, context: Context) {
        let coordinate = CLLocationCoordinate2D(
            latitude: 52.368222, longitude: 4.926369)
        let span = MKCoordinateSpan(latitudeDelta: 3.0, longitudeDelta: 3.0)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        view.setRegion(region, animated: true)
    }
    
}

struct MapView_Preview: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}

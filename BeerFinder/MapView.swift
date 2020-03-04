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
    
    let landmarks = Landmark.requestMockData()

    func makeUIView(context: Context) -> MKMapView{
        MKMapView(frame: .zero)
    }
    
    func updateUIView(_ view: MKMapView, context: Context){
        //passing model array here
        view.addAnnotations(landmarks)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}

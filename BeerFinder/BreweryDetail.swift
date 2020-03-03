//
//  ContentView.swift
//  BeerFinder
//
//  Created by Jurrian Lammerts on 02/03/2020.
//  Copyright © 2020 Jurrian Lammerts. All rights reserved.
//


import SwiftUI

struct BreweryDetail: View {
    var brewery : Brewery
    
    var body: some View {
        VStack {
            MapView(coordinate: brewery.locationCoordinate)
                .edgesIgnoringSafeArea(.top)
                .frame(height: 300)
            
            CircleImage(image: brewery.image)
                .offset(y: -120)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                Text(brewery.name)
                    .font(.title)
                HStack(alignment: .top) {
                    Text(brewery.city)
                        .font(.subheadline)
                    Spacer()
                    Text(brewery.country)
                        .font(.subheadline)
                }
                Text(brewery.description)
                    .padding(.top)
            }
            .padding([.top, .leading, .trailing])
            
            Spacer()
        }
        .navigationBarTitle(Text(brewery.name), displayMode: .inline)
    }
}

struct BreweryDetail_Preview: PreviewProvider {
    static var previews: some View {
        BreweryDetail(brewery: breweryData[0])
    }
}


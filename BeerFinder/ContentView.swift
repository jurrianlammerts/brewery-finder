//
//  ContentView.swift
//  BeerFinder
//
//  Created by Jurrian Lammerts on 02/03/2020.
//  Copyright © 2020 Jurrian Lammerts. All rights reserved.
//


import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            MapView()
                .edgesIgnoringSafeArea(.top)
                .frame(height: 300)

            CircleImage()
                .offset(y: -120)
                .padding(.bottom, -130)

            VStack(alignment: .leading) {
                Text("Brouwerij 't IJ")
                    .font(.title)
                HStack(alignment: .top) {
                    Text("Amsterdam")
                        .font(.subheadline)
                    Spacer()
                    Text("The Netherlands")
                        .font(.subheadline)
                }
            }
            .padding()

            Spacer()
        }
    }
}

struct ContentView_Preview: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

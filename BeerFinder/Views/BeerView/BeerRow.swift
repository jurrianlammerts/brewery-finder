//
//  BeerRow.swift
//  BeerFinder
//
//  Created by Jurrian Lammerts on 03/03/2020.
//  Copyright © 2020 Jurrian Lammerts. All rights reserved.


import SwiftUI
import URLImage

struct BeerRow: View {
    var beer: Beer
    
    var body: some View {
        HStack {
            URLImage(
                beer.image_url,
                content:  {
                    $0.image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 48.0)
            })
            
            Text(beer.name)
            Spacer()
        }
        .padding(.vertical)
        .frame(height: 60)
    }
}


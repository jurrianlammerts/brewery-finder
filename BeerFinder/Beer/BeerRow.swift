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
            
            URLImage(beer.image_url,
                     delay: 0.25,
                     processors: [ Resize(size: CGSize(width: 100.0, height: 100.0), scale: UIScreen.main.scale) ],
                     content:  {
                        $0.image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .clipped()
            })
                .frame(width: 14.0, height: 14.0)
            
            
            Text(beer.name)
            Spacer()
        }
        .padding(.vertical)
        
    }
}


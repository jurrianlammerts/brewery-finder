//
//  Row.swift
//  BeerFinder
//
//  Created by Jurrian Lammerts on 02/03/2020.
//  Copyright © 2020 Jurrian Lammerts. All rights reserved.
//

import SwiftUI

struct BreweryRow: View {
    var brewery: Brewery
    
    var body: some View {
        HStack {
            brewery.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(brewery.name)
            Spacer()
        }
        
    }
}


struct BreweryRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            BreweryRow(brewery: breweryData[0])
            BreweryRow(brewery: breweryData[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}

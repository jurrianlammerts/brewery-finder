//
//  BeerList.swift
//  BeerFinder
//
//  Created by Jurrian Lammerts on 03/03/2020.
//  Copyright © 2020 Jurrian Lammerts. All rights reserved.
//

import SwiftUI

struct BeerList: View {
    
    @ObservedObject private var beerListVM = BeerListViewModel()
    
    var body: some View {
        NavigationView{
            
            // Loop over the beers and make a list
            List(self.beerListVM.beers, id: \.name) { item in
                NavigationLink(destination: BeerDetail(beer: item.beer)) {
                    BeerRow(beer: item.beer)
                }
            }
            .navigationBarTitle(Text("Our favorite beers"))
        }
    }
}

struct BeerList_Previews: PreviewProvider {
    static var previews: some View {
        BeerList()
    }
}


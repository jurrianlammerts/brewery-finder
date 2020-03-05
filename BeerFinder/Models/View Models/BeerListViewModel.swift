//
//  BeerListViewModel.swift
//  BeerFinder
//
//  Created by Jurrian Lammerts on 03/03/2020.
//  Copyright © 2020 Jurrian Lammerts. All rights reserved.
//

import Foundation

class BeerListViewModel: ObservableObject {
    @Published var beers = [BeerViewModel]()
    
    init(){
        
        Api().fetchBeers { beers in
            
            if let beers = beers {
                self.beers = beers.map(BeerViewModel.init)
            }
        }
    }
}

struct BeerViewModel {
    
    var beer: Beer
    
    init(beer: Beer) {
        self.beer = beer
    }
    
    var id: Int {
        return self.beer.id
    }
    
    var name: String {
        return self.beer.name
    }
    
    var description: String{
        return self.beer.description
    }
    
    var imageUrl: URL{
        return self.beer.image_url
    }
}

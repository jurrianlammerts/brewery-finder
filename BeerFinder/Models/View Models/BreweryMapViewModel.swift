//
//  BreweryMapViewModel.swift
//  BeerFinder
//
//  Created by Jurrian Lammerts on 04/03/2020.
//  Copyright © 2020 Jurrian Lammerts. All rights reserved.
//

import Foundation

class BreweryMapViewModel: ObservableObject {
    @Published var breweries = [BreweryViewModel]()
    
    init(){
        
        Api().fetchBreweries { response in
            
            if let response = response {
                self.breweries = response.data.map(BreweryViewModel.init)
            }
        }
    }
}


struct BreweryViewModel {
    
    var brewery: Brewery
    
    init(brewery: Brewery) {
        self.brewery = brewery
    }
    
    var id: String {
        return self.brewery.id
    }
    
    var name: String {
        return self.brewery.name
    }
    
    var locations: [Location] {
        return self.brewery.locations ?? []
    }
}

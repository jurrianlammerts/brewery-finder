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
    @Published var dutchBreweries = [BreweryViewModel]()
    
    init(){
        
        Api().fetchBreweries { response in
            
            let dutchBreweryData: Response = load("breweryData.json")
            self.dutchBreweries = dutchBreweryData.data.map(BreweryViewModel.init)
            
            if let response = response {
                self.breweries = response.data.map(BreweryViewModel.init)
            }
            
            let allBreweries = self.dutchBreweries += self.dutchBreweries
                     
            print(allBreweries)
        }
    }
}


struct BreweryViewModel: Codable {
    
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

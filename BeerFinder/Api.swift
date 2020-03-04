//
//  Api.swift
//  BeerFinder
//
//  Created by Jurrian Lammerts on 03/03/2020.
//  Copyright © 2020 Jurrian Lammerts. All rights reserved.
//

import Foundation

class Api {
    
    func fetchBeers(withCompletion completion: @escaping ([Beer]?) -> Void) {
        
        guard let url = URL(string: "https://api.punkapi.com/v2/beers/?page=1&per_page=10") else {
            fatalError("Invalid URL")
        }
        
        URLSession.shared.dataTask(with: url){ data, response, error in
            
            guard let data = data, error == nil else{
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            
            do {
                let beers = try JSONDecoder().decode([Beer].self, from: data)
                
                DispatchQueue.main.async {
                    completion(beers)
                }
                
            } catch {
                print(error)
            }
        }.resume()
    }
}

//
//  Api.swift
//  BeerFinder
//
//  Created by Jurrian Lammerts on 03/03/2020.
//  Copyright © 2020 Jurrian Lammerts. All rights reserved.
//


// Constants
struct APIURL {
    struct Domains {
        static let BeerApi = "https://api.punkapi.com/v2/beers"
        static let BreweryApi = "https://sandbox-api.brewerydb.com/v2/breweries/?key=fb610d20aa9b20208d189285b83afa13&withLocations=Y"
    }
}

import UIKit
import SwiftUI
import CoreLocation

class Api {
    
    func fetchBeers(withCompletion completion: @escaping ([Beer]?) -> Void) {
        
        // Check if url is valid
        guard let url = URL(string: APIURL.Domains.BeerApi) else {
            fatalError("Invalid URL")
        }
        
        // Receive data directly into memory by creating a data task from a URL session
        URLSession.shared.dataTask(with: url){ data, response, error in
            
            guard let data = data, error == nil else{
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            
            do {
                // Decode JSON
                let beers = try JSONDecoder().decode([Beer].self, from: data)
                
                DispatchQueue.main.async {
                    completion(beers)
                }
                
            } catch {
                print(error)
            }
        }.resume()
    }
    
    func fetchBreweries(withCompletion completion: @escaping (Response?) -> Void) {
        
        // Check if url is valid
        guard let url = URL(string: APIURL.Domains.BreweryApi) else {
            fatalError("Invalid URL")
        }
        
        // Receive data directly into memory by creating a data task from a URL session
        URLSession.shared.dataTask(with: url){ data, response, error in
            
            guard let data = data, error == nil else{
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            
            do {
                // Decode JSON
                let reponse = try? JSONDecoder().decode(Response.self, from: data)
                
                DispatchQueue.main.async {
                    completion(reponse)
                }
                
            } catch {
                print(error)
            }
        }.resume()
    }
}


func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

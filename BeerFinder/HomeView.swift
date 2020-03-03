//
//  Home.swift
//  BeerFinder
//
//  Created by Jurrian Lammerts on 03/03/2020.
//  Copyright © 2020 Jurrian Lammerts. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView{
            
            BeerList()
                .tabItem{
                    VStack{
                        Image("beer")

                        Text("Beer")
                    }
            }.tag(1)
            
            BreweryList()
                .tabItem{
                    VStack{
                        Image("boiler")

                        Text("Brewery")
                    }
            }.tag(2)
            
            SettingView()
                .tabItem{
                    VStack{
                        Image("settings")
                        
                        Text("Settings")
                    }
            }.tag(3)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

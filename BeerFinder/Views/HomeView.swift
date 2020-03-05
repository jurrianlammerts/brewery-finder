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
                        Image(systemName: "list.dash")
                        Text("Beer")
                    }
            }.tag(1)
            
            BreweryMap()
                .tabItem{
                    VStack{
                        Image(systemName: "location")
                        Text("Map")
                    }
            }.tag(3)
            
            SettingsView()
                .tabItem{
                    VStack{
                        Image(systemName: "gear")
                        Text("Settings")
                    }
            }.tag(4)
        }.edgesIgnoringSafeArea(.top)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

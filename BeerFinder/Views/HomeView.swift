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
                        Text("Beer")
                    }
            }.tag(1)
            
            BreweryMap()
                .tabItem{
                    VStack{
                        Text("Map")
                }
            }.tag(3)
            
            SettingsView()
                .tabItem{
                    VStack{
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

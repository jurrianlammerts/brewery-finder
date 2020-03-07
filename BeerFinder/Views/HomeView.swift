//
//  Home.swift
//  BeerFinder
//
//  Created by Jurrian Lammerts on 03/03/2020.
//  Copyright © 2020 Jurrian Lammerts. All rights reserved.
//

import SwiftUI

class HomeViewController:ObservableObject {
     @Published var selection: Int = 0
}

struct HomeView: View {
    
    @State private var selectedTab: Int = 0
    
    var body: some View {
        TabView(selection: $selectedTab){
            BeerList()
                .tabItem{
                    VStack{
                        Image(systemName: "list.dash")
                        Text("Beer")
                    }
            }.tag(1)
            BreweryMap(selection: $selectedTab)
                .tabItem{
                    VStack{
                        Image(systemName: "location")
                        Text("Map")
                    }
            }.tag(2)
            SettingsView()
                .tabItem{
                    VStack{
                        Image(systemName: "gear")
                        Text("Settings")
                    }
            }.tag(3)
            
        }.edgesIgnoringSafeArea(.top)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

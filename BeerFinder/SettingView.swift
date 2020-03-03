//
//  SettingView.swift
//  BeerFinder
//
//  Created by Jurrian Lammerts on 03/03/2020.
//  Copyright © 2020 Jurrian Lammerts. All rights reserved.
//

import SwiftUI

struct SettingView: View {
    
    var settingsList = [
        Setting(id: 1, title: "Language", description: "Change the language of the App", isOn: false),
        Setting(id: 2, title: "Time", description: "Change the time of the App", isOn: false)
    ]
    
    var body: some View {
        NavigationView {
            List(settingsList, id: \.title) { setting in
                HStack {
                    NavigationLink(destination: SettingDetail(setting: setting)) {
                        Text(setting.title)
                    }
                }
                .navigationBarTitle(Text("Settings"))
            }
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}

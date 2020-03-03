//
//  SettingDetail.swift
//  BeerFinder
//
//  Created by Jurrian Lammerts on 03/03/2020.
//  Copyright © 2020 Jurrian Lammerts. All rights reserved.
//

import SwiftUI

struct SettingDetail: View {
    var setting: Setting
    @State private var selectedIndex: Int = 0
    
    var langaugeOptions = ["Dutch", "English", "German"]
    
    var body: some View {
        
        Form {
            Picker("Language", selection: $selectedIndex) {
                ForEach(0..<langaugeOptions.count) {
                    Text(self.langaugeOptions[$0])
                }
            }
        }
        
    }
    
}




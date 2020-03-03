//
//  SettingDetail.swift
//  BeerFinder
//
//  Created by Jurrian Lammerts on 03/03/2020.
//  Copyright © 2020 Jurrian Lammerts. All rights reserved.
//

import SwiftUI

struct SettingDetail: View {
    var setting : Setting
    
    var body: some View {
        VStack {
            HStack() {
//                Toggle(isOn: false) {
//                    setting.title
//                }
                
                Text(setting.title)
                
            }
            
        }
        .navigationBarTitle(Text(setting.title))
    }
}




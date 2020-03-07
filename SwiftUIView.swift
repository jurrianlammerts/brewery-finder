//
//  SwiftUIView.swift
//  BeerFinder
//
//  Created by Jurrian Lammerts on 06/03/2020.
//  Copyright © 2020 Jurrian Lammerts. All rights reserved.
//

import SwiftUI

struct TestNavigationFromAlert: View {

    @State private var showUnpairAlert: Bool = false
    @State private var activateLink: Bool = false

    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: Text("Your Onboarding page"), isActive: $activateLink,
                    label: { EmptyView() })

                // DEMO BUTTON - REMOVE IT
                Button(action: { self.showUnpairAlert = true }) { Text("Alert") }

                // YOUR CODE IS HERE
            }
            .alert(isPresented: $showUnpairAlert) {
                 Alert(title: Text("Unpair from \(checkForDeviceInformation())"), message: Text("Do you want to unpair the current pod?"), primaryButton: .destructive(Text("Unpair")) {
                     self.unpairAndSetDefaultDeviceInformation()
                     }, secondaryButton: .cancel())
             }
        }
    }

    func checkForDeviceInformation() -> String {
        // YOUR CODE IS HERE
        return "Stub information"
    }

    func unpairAndSetDefaultDeviceInformation() {
        // YOUR CODE IS HERE
        DispatchQueue.main.async {
            self.activateLink = true
        }
    }
}

struct TestNavigationFromAlert_Previews: PreviewProvider {
    static var previews: some View {
        TestNavigationFromAlert()
    }
}

//
//  BeerDetail.swift
//  BeerFinder
//
//  Created by Jurrian Lammerts on 03/03/2020.
//  Copyright © 2020 Jurrian Lammerts. All rights reserved.
//

import SwiftUI
import URLImage

struct BeerDetail: View {
    var beer : Beer
    
    var body: some View {
        VStack {
            
            URLImage(beer.image_url,
            placeholder: {
                ProgressView($0) { progress in
                    ZStack {
                        if progress > 0.0 {
                            CircleProgressView(progress).stroke(lineWidth: 8.0)
                        }
                        else {
                            CircleActivityView().stroke(lineWidth: 50.0)
                        }
                    }
                }
                    .frame(width: 50.0, height: 50.0)
            },
            content: {
                $0.image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                    .padding(.all, 40.0)
                    .shadow(radius: 10.0)
            })
            
            
            VStack(alignment: .leading) {
                Text(beer.name)
                    .font(.title)
                
                Text(beer.description)
                    .padding(.top)
            }
            .padding([.top, .leading, .trailing])
            
            Spacer()
        }
        .navigationBarTitle(Text(beer.name), displayMode: .inline)
    }
}


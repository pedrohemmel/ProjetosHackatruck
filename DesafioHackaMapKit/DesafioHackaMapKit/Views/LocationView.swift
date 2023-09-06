//
//  LocationView.swift
//  DesafioHackaMapKit
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 06/09/23.
//

import Foundation
import SwiftUI

struct LocationView: View {
    @Binding var location: Location
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: location.locationFlag)) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .shadow(radius: 10)
            } placeholder: {
                Color.blue.opacity(0.1)
            }
            
            Text("\(location.description)")
        }
        .padding()
    }
}

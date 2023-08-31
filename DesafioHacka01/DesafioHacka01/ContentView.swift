//
//  ContentView.swift
//  DesafioHacka01
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 31/08/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image("priFoto")
                .resizable()
                .scaledToFit()
            Text("HackaTruck")
                .font(.system(size: 25, weight: .bold))
                .foregroundColor(.blue)
            HStack {
                Text("Maker")
                    .font(.system(size: 17, weight: .bold))
                    .foregroundColor(.yellow)
                Text("Spacer")
                    .font(.system(size: 17, weight: .bold))
                    .foregroundColor(.red)
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

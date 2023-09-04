//
//  ContentView.swift
//  DesafioHacka6
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 04/09/23.
//

import SwiftUI

struct ContentView: View {
    @State var tertiaryViewIsPresented = false
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                NavigationLink(destination: FirstModeView()) {
                    Text("Mode 1")
                }
                NavigationLink(destination: SecondModeView()) {
                    Text("Mode 2")
                }
                Button {
                    tertiaryViewIsPresented = true
                } label: {
                    Text("Mode 3")
                }
                .sheet(isPresented: $tertiaryViewIsPresented) {
                    TertiaryModeView()
                }
                Spacer()
            }
            .padding()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

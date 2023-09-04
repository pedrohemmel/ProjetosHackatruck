//
//  ContentView.swift
//  DesafioHacka05
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 04/09/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            ListView()
                .tabItem {
                    Label("list", systemImage: "list.clipboard")
                }
            HelloStackView()
                .tabItem {
                    Label("hello stack", systemImage: "rectangle.stack")
                }
            PhotosView()
                .tabItem {
                    Label("photo list", systemImage: "photo.stack")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

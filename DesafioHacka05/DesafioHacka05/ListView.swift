//
//  ListView.swift
//  DesafioHacka05
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 04/09/23.
//

import SwiftUI

struct ListView: View {
    var body: some View {
        List(0...20, id: \.self) { i in
            Text("Item \(i)")
        }
    }
}

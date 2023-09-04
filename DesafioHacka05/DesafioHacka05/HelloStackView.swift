//
//  HelloStackView.swift
//  DesafioHacka05
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 04/09/23.
//

import SwiftUI

struct HelloStackView: View {
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text("Hello, Hackatruck")
                Spacer()
            }
            .padding(.vertical, 150)
            .background(.blue)
            .padding(.horizontal, 50)
        }
    }
}

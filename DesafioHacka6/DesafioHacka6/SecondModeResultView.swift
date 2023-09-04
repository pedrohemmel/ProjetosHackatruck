//
//  SecondModeResultView.swift
//  DesafioHacka6
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 04/09/23.
//

import SwiftUI

struct SecondModeResultView: View {
    @Binding var text: String
    var body: some View {
        VStack {
            Spacer()
            Text("Volta \(text)")
            Spacer()
        }
    }
}

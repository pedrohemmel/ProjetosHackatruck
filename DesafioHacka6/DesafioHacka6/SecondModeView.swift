//
//  SecondModeView.swift
//  DesafioHacka6
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 04/09/23.
//

import SwiftUI

struct SecondModeView: View {
    @State var text: String = String()
    var body: some View {
        VStack {
            Spacer()
            TextField("Type your name here", text: $text)
            NavigationLink(destination: SecondModeResultView(text: $text)) {
                Text("Action")
            }
            Spacer()
        }
        
    }
}

//
//  ContentView.swift
//  DesafioHacka02
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 31/08/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var caminhoCaminhao = 0.0
    
    var body: some View {
        VStack {
            ZStack {
                Text("VRUMMMMMM...")
                Image("priFoto")
                    .resizable()
                    .frame(height: 250)
                    .padding(.leading, -caminhoCaminhao)
                    .padding(.trailing, caminhoCaminhao)
                    .onAppear {
                        withAnimation(.linear(duration: 5)) {
                            caminhoCaminhao = 400
                        }
                    }
            }
            Spacer()
            ZStack {
                Image("priFoto")
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                Text("HackaTruck")
                    .font(.system(size: 25, weight: .bold))
                    .foregroundColor(.blue)
                    .padding(.bottom, 90)
            }
            Spacer()
            HStack {
                Text("Maker")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.yellow)
                Text("Spacer")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.red)
            }
            .padding(.top)
            .padding(.horizontal, 90)
            .padding(.bottom, 90)
            .background(.black)
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

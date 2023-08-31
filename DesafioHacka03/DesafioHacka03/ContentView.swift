//
//  ContentView.swift
//  DesafioHacka03
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 31/08/23.
//

import SwiftUI

struct ContentView: View {
    @State var pessoa: String = String()
    @State var alertIsShowing = false
    var body: some View {
        ZStack {
            VStack {
                Text("Bem vindo, \(pessoa == "" ? "Usuário(a)" : pessoa)")
                    .font(.system(size: 25, weight: .bold))
                TextField("Digite aqui", text: $pessoa)
                    .padding(5)
                    .background(.white)
                    .cornerRadius(10)
                    .padding(.horizontal, 40)
                Spacer()
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .padding(.horizontal, 40)
                Image("truck")
                    .resizable()
                    .scaledToFit()
                    .padding(.horizontal, 40)
                Spacer()
                Button("Entrar") {
                    alertIsShowing = true
                }
                .alert(isPresented: $alertIsShowing) {
                    Alert(
                        title: Text("ALERTA PARA \(pessoa == "" ? "Usuário(a)".uppercased() : pessoa.uppercased())!"),
                        message: Text("Você irá iniciar o desafio da aula agora"),
                        dismissButton: .default(Text("Vamos la!"))
                    )
                }
            }
        }
        .background(
            Image("priFoto")
                .resizable()
                .scaledToFill()
                .opacity(0.3)
                .blur(radius: 5)
                .ignoresSafeArea()
        )
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

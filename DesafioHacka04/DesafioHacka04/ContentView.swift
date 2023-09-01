//
//  ContentView.swift
//  DesafioHacka04
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 01/09/23.
//

import SwiftUI

struct ContentView: View {
    @State var corAtual = Color("normal")
    @State var estadoPessoa = "Normal"
    @State var peso = String()
    @State var altura = String()
    @State var IMC = Double()
    
    var body: some View {
        VStack {
            Text("Calculadora de IMC")
                .font(.system(size: 30, weight: .bold))
                .foregroundColor(.white)
            TextField("Peso", text: $peso)
                .padding(5)
                .background(.white)
                .cornerRadius(10)
                .padding(.horizontal)
                .multilineTextAlignment(.center)
                
            TextField("Altura", text: $altura)
                .padding(5)
                .background(.white)
                .cornerRadius(10)
                .padding(.horizontal)
                .multilineTextAlignment(.center)
                
            Button("Calcular") {
                IMC = (Double(peso) ?? 0.0)/((Double(altura) ?? 0.0)*(Double(altura) ?? 0.0))
                print(IMC)
                preditaEstadoPessoa()
            }
            .padding(10)
            .padding(.horizontal)
            .background(.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            
            Spacer()
            Text("\(estadoPessoa)")
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(.white)
            Spacer()
            
            Image("tabela-IMC")
                .resizable()
                .scaledToFit()
                .cornerRadius(10)
                .padding()
        }
        .background(
            corAtual
                .ignoresSafeArea()
        )
    }
    
    func preditaEstadoPessoa() {
        switch IMC {
        case 0..<18.5:
            estadoPessoa = "Baixo peso"
            corAtual = Color("baixoPeso")
        case 18.5...24.99:
            estadoPessoa = "Normal"
            corAtual = Color("normal")
        case 25...29.99:
            estadoPessoa = "Sobrepeso"
            corAtual = Color("sobrePeso")
        default:
            if IMC > 0 {
                estadoPessoa = "Obesidade"
                corAtual = Color("obesidade")
            } else {
                print("Não preditado.")
                estadoPessoa = "IMC não válido"
                corAtual = .black
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

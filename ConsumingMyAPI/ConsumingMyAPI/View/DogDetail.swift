//
//  DogDetail.swift
//  ConsumingMyAPI
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 13/09/23.
//

import Foundation
import SwiftUI

struct DogDetail: View {
    let dog: Dog
    
    var body: some View {
        VStack {
            if let url = URL(string: dog.foto ?? "") {
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .padding(.horizontal, 30)
                        .background(.white)
                } placeholder: {
                    Color(.black)
                }
            }
            Text("\(dog.nome_cachorro ?? "N/A")")
                .font(.system(size: 30, weight: .bold))
                .foregroundColor(.red)
                .padding(.top)
            
            HStack {
                Text("Nível de relevância")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.gray)
                Spacer()
                Text("\(String(dog.nivel_relevancia ?? 0))")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.gray)
            }
            .padding(.top)
            Spacer()
        }
        .padding()
        .background(
            Color.black
                .ignoresSafeArea()
        )
        
        
        
    }
}

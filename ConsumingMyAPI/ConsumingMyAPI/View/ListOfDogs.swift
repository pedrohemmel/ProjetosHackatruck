//
//  ContentView.swift
//  ConsumingMyAPI
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 13/09/23.
//

import SwiftUI

struct ListOfDogs: View {
    
    @StateObject var listOfDogsViewModel = ListOfDogsViewModel()
    
    var body: some View {
        NavigationStack {
            if listOfDogsViewModel.dogsData.data.isEmpty {
                ZStack {
                    ProgressView()
                        .tint(.white)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(.black)
                .ignoresSafeArea()
            } else {
                ScrollView {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], content: {
                        ForEach(listOfDogsViewModel.dogsData.data) { dog in
                            NavigationLink {
                                DogDetail(dog: dog)
                            } label: {
                                VStack {
                                    if let url = URL(string: dog.foto ?? "") {
                                        AsyncImage(url: url) { image in
                                            image
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: UIScreen.main.bounds.width * 0.35, height: UIScreen.main.bounds.width * 0.35)
                                                .background(.white)
                                        } placeholder: {
                                            Color(.black)
                                        }
                                    }
                                    
                                    Text("\(dog.nome_cachorro ?? "Sem título")")
                                        .font(.system(size: 20, weight: .semibold))
                                        .foregroundColor(.red)
                                    
                                    Spacer()
                                }
                                .padding()
                                .border(.gray)
                                
                                
                            }
                        }
                    })
                    
                    
                }
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("Doguinhos")
                            .font(.system(size: 30, weight: .bold))
                            .foregroundColor(.red)
                    }
                }
                
                .padding()
                .background(.black)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ListOfDogs()
    }
}

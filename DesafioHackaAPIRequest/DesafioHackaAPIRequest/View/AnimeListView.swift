//
//  ContentView.swift
//  DesafioHackaAPIRequest
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 12/09/23.
//

import SwiftUI

struct AnimeListView: View {
    @StateObject var animeDataViewModel = AnimeDataViewModel()
    var body: some View {
        NavigationStack {
            if animeDataViewModel.animeData.data.isEmpty {
                ZStack {
                    ProgressView()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color("blackAnimes"))
                .ignoresSafeArea()
            } else {
                ScrollView {
                    VStack {
                        ForEach(animeDataViewModel.animeData.data) { anime in
                            NavigationLink {
                                AnimeDetailView(animeInfo: anime)
                            } label: {
                                HStack {
                                    if let url = URL(string: anime.images?.jpg?.image_url ?? "") {
                                        AsyncImage(url: url) { image in
                                            image
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 80, height: 80)
                                        } placeholder: {
                                            Color(.black)
                                        }
                                    }
                                    
                                    VStack(alignment: .leading) {
                                        Text("\(anime.title ?? "Sem título")")
                                            .multilineTextAlignment(.leading)
                                            .font(.system(size: 20, weight: .semibold))
                                            .foregroundColor(Color("blueTextAnimes"))
                                        Text("\(String(anime.episodes ?? 0)) episodes")
                                            .multilineTextAlignment(.leading)
                                            .font(.system(size: 13))
                                            .foregroundColor(.gray)
                                        Text("\(anime.duration ?? "")")
                                            .multilineTextAlignment(.leading)
                                            .font(.system(size: 13))
                                            .foregroundColor(.gray)
                                    }
                                    Spacer()
                                }
                                .padding()
                                .border(.gray)
                                .cornerRadius(10)
                                
                            }
                        }
                    }
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .principal) {
                            Text("Animes")
                                .font(.system(size: 30, weight: .bold))
                                .foregroundColor(Color("blueTextAnimes"))
                        }
                    }
                    
                    .padding()
                }
                .background(Color("blackAnimes"))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AnimeListView()
    }
}

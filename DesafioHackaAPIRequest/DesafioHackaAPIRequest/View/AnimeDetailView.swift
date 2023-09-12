//
//  AnimeDetailView.swift
//  DesafioHackaAPIRequest
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 12/09/23.
//

import Foundation
import SwiftUI

struct AnimeDetailView: View {
    let animeInfo: AnimeInfo
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: animeInfo.images?.jpg?.image_url ?? "")) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
            } placeholder: {
                Color(.black)
            }
            Text("\(animeInfo.title ?? "")")
                .font(.system(size: 30, weight: .bold))
                .foregroundColor(Color("blueTextAnimes"))
            Spacer()
            HStack {
                VStack(alignment: .leading) {
                    Text("Episodes")
                        .multilineTextAlignment(.leading)
                        .font(.system(size: 20))
                        .foregroundColor(.gray)
                        .padding(.bottom, 5)
                    Text("Duration")
                        .multilineTextAlignment(.leading)
                        .font(.system(size: 20))
                        .foregroundColor(.gray)
                        .padding(.bottom, 5)
                    Text("Status")
                        .multilineTextAlignment(.leading)
                        .font(.system(size: 20))
                        .foregroundColor(.gray)
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Text("\(String(animeInfo.episodes ?? 0))")
                        .multilineTextAlignment(.leading)
                        .font(.system(size: 20))
                        .foregroundColor(.gray)
                        .padding(.bottom, 5)
                    Text("\(animeInfo.duration ?? "")")
                        .multilineTextAlignment(.leading)
                        .font(.system(size: 20))
                        .foregroundColor(.gray)
                        .padding(.bottom, 5)
                    Text("\(animeInfo.status ?? "")")
                        .multilineTextAlignment(.leading)
                        .font(.system(size: 20))
                        .foregroundColor(.gray)
                }
            }
            Spacer()
            Button {
                if let url = URL(string: animeInfo.url ?? "") {
                    UIApplication.shared.open(url)
                }
            } label: {
                HStack {
                    Spacer()
                    Text("Watch now!")
                        .foregroundColor(.white)
                    Spacer()
                }
                .frame(height: 50)
                .background(.blue)
                .cornerRadius(10)
                .padding()
            }
            Spacer()
        }
        .padding()
        .background(
            Color("blackAnimes")
                .ignoresSafeArea()
        )
    }
}

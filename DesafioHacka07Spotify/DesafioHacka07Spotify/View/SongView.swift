//
//  SongView.swift
//  DesafioHacka07Spotify
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 05/09/23.
//

import SwiftUI

struct SongView: View {
    @Environment(\.dismiss) var dismiss
    
    var title: String
    var song: Song
    var color: String
    
    @State private var sliderValue = 0.0
    @State private var isEditing = false
    
    var body: some View {
        VStack {
            
            //MARK: Song cover
            Spacer()
            AsyncImage(url: URL(string: song.image)) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                    .background(.white)
            } placeholder: {
                Color.blue.opacity(0.1)
            }
            Spacer()
            
            //MARK: Song title and artist
            HStack {
                VStack(alignment: .leading) {
                    Text("\(song.name)")
                        .font(.system(size: 25, weight: .bold))
                        .lineLimit(1)
                        .foregroundColor(.white)
                        .padding(.top)
                    Text("\(song.artist)")
                        .font(.system(size: 15))
                        .lineLimit(1)
                        .padding(.bottom)
                }
                Spacer()
                Image(systemName: "plus.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25)
                    .padding(.trailing)
            }
            .padding(.top)
            .foregroundColor(.white)
            
            //MARK: Song slider
            Slider(value: $sliderValue, in: 0...100, onEditingChanged: { editing in
                isEditing = editing
            })
            .accentColor(.white)
                
            //MARK: Song actions
            HStack {
                Image(systemName: "shuffle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25)
                Spacer()
                Image(systemName: "backward.end.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25)
                Spacer()
                Button {
                    //Action to play
                } label: {
                    Image(systemName: "pause")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 25)
                        .foregroundColor(Color("blackSpotify"))
                        .padding(25)
                        .background(.white)
                        .clipShape(Circle())
                }
                Spacer()
                Image(systemName: "forward.end.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25)
                Spacer()
                Image(systemName: "repeat")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25)
            }
            .foregroundColor(.white)
        }
        .padding()
        .background(
            LinearGradient(gradient: Gradient(colors: [Color(color), Color("blackSpotify")]), startPoint: .top, endPoint: .bottom)
        )
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    HStack {
                        Image(systemName: "chevron.backward")
                        Text("Back")
                    }
                    .foregroundColor(.white)
                }
            }
            
            ToolbarItem(placement: .principal) {
                Text("\(title)")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .lineLimit(1)
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                Image(systemName: "ellipsis")
                    .foregroundColor(.white)
            }
        }
    }
}

//
//  ContentView.swift
//  DesafioHacka07Spotify
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 05/09/23.
//

import SwiftUI



struct AlbumView: View {
    @State private var playlist = playlists[0]
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    //MARK: playlist cover
                    ZStack {
                        VStack(alignment: .leading) {
                            AsyncImage(url: URL(string: playlist.image)) { image in
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .padding(.horizontal, 50)
                            } placeholder: {
                                Color.purple.opacity(0.1)
                            }
                            
                            //MARK: playlist title
                            Text("\(playlist.name)")
                                .font(.system(size: 25, weight: .bold))
                                .foregroundColor(.white)
                                
                            //MARK: playlist artist
                            HStack {
                                AsyncImage(url: URL(string: playlist.imageArtist)) { image in
                                    image
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 25)
                                        .clipShape(Circle())
                                } placeholder: {
                                    Color.blue.opacity(0.1)
                                }
                                Text("\(playlist.artist)")
                                    .font(.system(size: 15, weight: .bold))
                                    .foregroundColor(.white)
                            }
                            
                            //MARK: playlist launch year
                            Text("Album - \(playlist.ano)")
                                .font(.system(size: 15))
                                .foregroundColor(.white)
                        }
                        .padding(.top, 70)
                        .padding(.horizontal)
                    }
                    .background(
                        LinearGradient(
                            gradient: Gradient(colors: [Color(playlist.color), Color(playlist.color), Color("blackSpotify")]),
                            startPoint: .top,
                            endPoint: .bottom)
                    )
                    
                    //MARK: playlist actions
                    HStack {
                        Image(systemName: "plus.circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25)
                            .padding(.trailing)
                        Image(systemName: "arrow.down.circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25)
                            .padding(.trailing)
                        Image(systemName: "ellipsis")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25)
                        Spacer()
                        Image(systemName: "shuffle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25)
                            .padding(.trailing)
                        Button {
                            //Action to play
                        } label: {
                            Image(systemName: "pause")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 25)
                                .foregroundColor(Color("blackSpotify"))
                                .padding(20)
                                .background(Color("greenSpotify"))
                                .clipShape(Circle())
                        }
                    }
                    .padding(.horizontal)
                    .foregroundColor(.white)
                    
                    //MARK: List of songs
                    ForEach(playlist.songs, id: \.id) { song in
                        NavigationLink {
                            SongView(title: "\(playlist.name)", song: song, color: playlist.color)
                        } label: {
                            HStack {
                                AsyncImage(url: URL(string: song.image)) { image in
                                    image
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 30)
                                        .padding(.trailing, 5)
                                } placeholder: {
                                    Color.blue.opacity(0.1)
                                }
                                VStack(alignment: .leading) {
                                    Text("\(song.name)")
                                        .font(.system(size: 20, weight: .semibold))
                                        .lineLimit(1)
                                    Text("\(song.artist)")
                                        .font(.system(size: 15))
                                        .lineLimit(1)
                                }
                                Spacer()
                                Image(systemName: "ellipsis")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 15)
                                
                            }
                            .foregroundColor(.white)
                        }
                        .padding(.bottom, 5)

                    }
                    .padding(.horizontal)
                    
                    //MARK: playlist artist
                    HStack {
                        AsyncImage(url: URL(string: playlist.imageArtist)) { image in
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50)
                                .clipShape(Circle())
                                .padding(.trailing, 5)
                        } placeholder: {
                            Color.blue.opacity(0.1)
                        }
                        
                        Text("\(playlist.artist)")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(.white)
                    }
                    .padding(.top)
                    .padding(.bottom, 30)
                    .padding(.horizontal)
                    
                    //MARK: You might also like section
                    Text("You might also like")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.white)
                        .padding(.horizontal)
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(playlists, id: \.id) { playlist in
                                if !(playlist.name == self.playlist.name) {
                                    Button {
                                        self.playlist = playlist
                                    } label: {
                                        VStack(alignment: .leading) {
                                            AsyncImage(url: URL(string: playlist.image)) { image in
                                                image
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: 150)
                                                    .padding(.trailing)
                                            } placeholder: {
                                                Color.blue.opacity(0.1)
                                            }
                                            Text("\(playlist.name)")
                                                .font(.system(size: 15, weight: .bold))
                                                .foregroundColor(.white)
                                                .frame(maxWidth: 150)
                                                .lineLimit(1)
                                        }
                                    } 
                                }
                            }
                        }
                    }
                    .padding(.horizontal)
                }
            }
            .ignoresSafeArea(.all, edges: .top)
            .background(Color("blackSpotify"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumView()
    }
}

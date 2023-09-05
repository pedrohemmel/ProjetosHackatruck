//
//  Song.swift
//  DesafioHacka07Spotify
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 05/09/23.
//

import Foundation
struct Song: Identifiable {
    let id = UUID()
    let name: String
    let artist: String
    let image: String
}

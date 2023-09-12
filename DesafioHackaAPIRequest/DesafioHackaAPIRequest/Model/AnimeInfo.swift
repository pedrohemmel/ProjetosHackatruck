//
//  AnimeInfo.swift
//  DesafioHackaAPIRequest
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 12/09/23.
//

import Foundation

struct AnimeInfo: Codable, Identifiable {
    let id = UUID()
    let mal_id: Int?
    let url: String?
    let images: ImageData?
    let title: String?
    let episodes: Int?
    let status: String?
    let duration: String?
}

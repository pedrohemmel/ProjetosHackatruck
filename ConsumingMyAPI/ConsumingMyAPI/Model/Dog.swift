//
//  Dog.swift
//  ConsumingMyAPI
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 13/09/23.
//

import Foundation

struct Dog: Codable, Identifiable {
    let id = UUID()
    let nome_cachorro: String?
    let nivel_relevancia: Int?
    let foto: String?
}

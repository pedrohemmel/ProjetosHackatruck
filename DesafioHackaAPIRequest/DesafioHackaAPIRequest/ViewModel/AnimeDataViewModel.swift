//
//  AnimeDataViewModel.swift
//  DesafioHackaAPIRequest
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 12/09/23.
//

import Foundation

class AnimeDataViewModel: ObservableObject {
    @Published var animeData = AnimeData(data: [AnimeInfo]())
    
    init() {
        fetchAnimes()
    }
    
    func fetchAnimes() {
        guard let url = URL(string: "https://api.jikan.moe/v4/anime") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let dataInfo = try JSONDecoder().decode(AnimeData.self, from: data)
                DispatchQueue.main.async {
                    self?.animeData = dataInfo
                    print(dataInfo)
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
}

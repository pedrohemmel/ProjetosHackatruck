//
//  ListOfSongsViewModel.swift
//  ConsumingMyAPI
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 13/09/23.
//

import Foundation

class ListOfDogsViewModel: ObservableObject {
    @Published var dogsData = DogsData(data: [Dog]())
    
    init() {
        fetch()
    }
    
    func fetch() {
        guard let url = URL(string: "http://127.0.0.1:1880/souzaREAD") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let info = try JSONDecoder().decode([DogsData].self, from: data)
                DispatchQueue.main.async {
                    self?.dogsData = info[0]
                }
            } catch {
                
                print(error)
            }
        }
        
        
        task.resume()
    }
}

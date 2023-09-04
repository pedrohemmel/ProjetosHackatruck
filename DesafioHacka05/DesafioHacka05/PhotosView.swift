//
//  PhotosView.swift
//  DesafioHacka05
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 04/09/23.
//

import SwiftUI

struct PhotosView: View {
    let images = [
        "hare.fill",
        "tortoise.fill",
        "pawprint",
        "sailboat.circle.fill"
    ]
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(images, id: \.self) { imageSource in
                    Image(systemName: imageSource)
                        .resizable()
                        .scaledToFit()
                        .padding(40)
                }
            }
        }
    }
}

//
//  Location.swift
//  DesafioHackaMapKit
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 06/09/23.
//

import Foundation
import MapKit

struct Location: Identifiable {
    let id = UUID()
    let name: String
    let location: CLLocationCoordinate2D
    let locationFlag: String
    let description: String
}

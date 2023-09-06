//
//  ContentView.swift
//  DesafioHackaMapKit
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 06/09/23.
//

import SwiftUI
import MapKit

struct MapView: View {
    @State var currentRegion = MKCoordinateRegion(center: locations[0].location, span: MKCoordinateSpan(latitudeDelta: 8, longitudeDelta: 8))
    @State var currentLocation = locations[0]
    
    @State var locationViewIsPresented = false
    var body: some View {
        
        VStack {
            ZStack {
                Map(coordinateRegion: $currentRegion, annotationItems: locations) { location in
                    MapAnnotation(coordinate: location.location) {
                        Button {
                            locationViewIsPresented = true
                        } label: {
                            AsyncImage(url: URL(string: location.locationFlag)) { image in
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 100)
                                    .background(.white)
                                    .clipShape(Circle())
                            } placeholder: {
                                Color.blue.opacity(0.1)
                            }
                        }
                        .sheet(isPresented: $locationViewIsPresented) {
                            LocationView(location: $currentLocation)
                        }
                    }
                }
                .ignoresSafeArea()
                VStack {
                    VStack {
                        Text("World map")
                            .font(.system(size: 25, weight: .bold))
                        Text("\(currentLocation.name)")
                    }
                    .padding()
                    .background(.white)
                    .cornerRadius(10)
                    .padding([.bottom, .leading, .trailing])
                    
                    Spacer()
                    
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(locations) { location in
                                Button {
                                    currentRegion = MKCoordinateRegion(center: location.location, span: MKCoordinateSpan(latitudeDelta: 8, longitudeDelta: 8))
                                    currentLocation = location
                                } label: {
                                    Text(location.name)
                                        .padding()
                                        .background(.blue)
                                        .foregroundColor(.white)
                                        .cornerRadius(10)
                                }
                                .padding(.leading)
                            }
                        }
                    }
                }
                
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}

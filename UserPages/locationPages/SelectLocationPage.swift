//
//  SelectLocationPage.swift
//  fixHouse
//
//  Created by Mohammed on 27/11/1444 AH.
//

import SwiftUI
import MapKit



struct SelectLocationPage: View {
    
    @State private var isButtonPressed = false
    @State private var locations = [Location]()
    @State private var mapRegion =
    MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 25, longitude:47),
                       span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1))

    
    var body: some View {
        if isButtonPressed == true{
            PaymentPage()
        } else {
            NavigationView {
                ZStack {
                    Map(coordinateRegion: $mapRegion)
                        .ignoresSafeArea()
                    Image(systemName: "mappin.circle.fill")
                        .font(.largeTitle)
                        .foregroundColor(.red)
                        .frame(width: 32, height: 32)
                    VStack {
                        Spacer()

                        HStack {
                            
                            Button {
                                let newLocation = Location(id: UUID(), name: "New location", description: "", latitude: mapRegion.center.latitude, longitude: mapRegion.center.longitude)
                                locations.append(newLocation)
                                isButtonPressed = true
                                
                                print(locations)
                            } label: {
                                Image(systemName: "plus")
                                
                            }
                            .padding()
                            .background(.black.opacity(0.75))
                            .foregroundColor(.white)
                            .font(.title)
                            .clipShape(Circle())
                            .padding(.trailing)
                            
                      
                        }.padding()
                    }
                }
            }
        }
        
    }
}

struct SelectLocationPage_Previews: PreviewProvider {
    static var previews: some View {
        SelectLocationPage()
    }
}



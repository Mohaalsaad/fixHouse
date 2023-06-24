//
//  ServiesDetailsPage.swift
//  fixHouse
//
//  Created by Mohammed on 25/11/1444 AH.
//

import SwiftUI
import Combine

struct ServiesDetailsPage: View {
    @StateObject var vm = OrderViewModel()
    var servies: Servies
    @State var detailsfororder = ""
    @State var datefororder = Date.now
    @State var showDetail = false
    @State var CustomerName = ""
    @State var Phone = ""
    let textLimit = 10 //Your limit
    var body: some View {
        NavigationView {
            ScrollView {
                ZStack() {
                
                    VStack{
                        Text(servies.titel)
                            .font(.system(size: 25, weight: .light, design: .serif))
                            .padding()
                        
                        Image(servies.image)
                            .resizable()
                            .frame(width: 300 , height: 250)
                        
                        VStack(spacing: 30){
                            Text("Order Details")
                                .font(.title3)
                                .bold()
                            test()
                            TextField("Enter Your name", text: $CustomerName)
                                .padding()
                                .background(Color.white.opacity(0.9))
                                .cornerRadius(10)
                                .shadow(color: .gray, radius: 2, x: 2, y: 1)
                            TextField("Phone Number", text: $Phone)
                                .onReceive(Just(Phone)) { _ in limitText(textLimit) }
                                .keyboardType(.numberPad)
                                .padding()
                                .background(Color.white.opacity(0.9))
                                .cornerRadius(10)
                                .shadow(color: .gray, radius: 2, x: 2, y: 1)
                            TextField("add detils", text: $detailsfororder , axis: .vertical)
                                .padding()
                                .background(Color.white.opacity(0.9))
                                .cornerRadius(10)
                                .shadow(color: .gray, radius: 2, x: 2, y: 1)
                            
                            Text("Total prise: 25 $")
                                .padding()
                            
                        }.padding()
                            .overlay(
                                
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(.gray, lineWidth: 1)
                                    .shadow(color: .gray, radius: 1, x: 1, y: 1))
                        
                            .padding()
                        
                        NavigationLink() {
                            ComformOrderPage(se: Servies(image: servies.image, titel: servies.titel, details: servies.details), detailsfororder: $detailsfororder,
                                             datefororder: $datefororder,
                                             CustomerName: $CustomerName,
                                             Phone: $Phone)
                            .navigationBarBackButtonHidden(true)
                        } label: {
                            Text("Cheak Out")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.vertical)
                                .frame(maxWidth: .infinity)
                                .background(Color.black)
                                .cornerRadius(20)
                                .shadow(color: .gray, radius: 1, x: 1, y: 1)
                        }.padding()
                        
                    }
                    
                    
                    
                }
            }
            
            
        }
    }
    func limitText(_ upper: Int) {
        if Phone.count > upper {
            Phone = String(Phone.prefix(upper))
        }
    }
}



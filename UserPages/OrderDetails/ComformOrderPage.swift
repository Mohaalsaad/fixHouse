//
//  ComformOrderPage.swift
//  fixHouse
//
//  Created by Mohammed on 25/11/1444 AH.
//

import SwiftUI
import FirebaseFirestore
import FirebaseAuth

struct ComformOrderPage: View {
    var random = Int.random(in: 1...999999)
    var se : Servies
    @State var success = false
    @Binding var detailsfororder : String
    @Binding var datefororder : Date
    @Binding var CustomerName : String
    @Binding var Phone : String
        @State var showNextPage = false
    var body: some View {
        if showNextPage == true{
            PaymentPage()
        } else {
            NavigationView {
                VStack{
                    Text("Order Detils")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    Spacer()
                    VStack{
                        HStack{
                            Text("Servies Kind: ")
                                .font(.title3)
                                .bold()
                                .padding()
                            Spacer()
                            Text(se.titel)
                                .font(.title3)
                                .bold()
                                .padding()
                        }
                        HStack{
                            Text("Your Phone Number: ")
                                .font(.title3)
                                .bold()
                                .padding()
                            Spacer()
                            Text(Phone)
                                .font(.title3)
                                .bold()
                                .padding()
                        }
                        HStack{
                            Text("Your Order Number: ")
                                .font(.title3)
                                .bold()
                                .padding()
                            Spacer()
                            Text("\(String(random))")
                                .font(.title3)
                                .bold()
                                .padding()
                        }
                        HStack{
                            Text("Your Deitails: ")
                                .font(.title3)
                                .bold()
                                .padding()
                            Spacer()
                            Text(detailsfororder)
                                .font(.title3)
                                .bold()
                                .padding()
                        }
                    }
                    Spacer()
                    Rectangle()
                        .frame(height: 2)
                        .frame(maxWidth: .infinity )
                        .foregroundColor(.black)
                        .padding()
                    ExtractedView()
                    NavigationLink {
                        SelectLocationPage()
                            .navigationBarBackButtonHidden(true)
                    } label: {
                        Text("Select Your Location")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.vertical)
                            .frame(maxWidth: .infinity)
                            .background(Color.black)
                            .cornerRadius(20)
                            .shadow(color: .gray, radius: 2, x: 3, y: 3)
                    }.padding()
                    
                    Button {
                        addToDataBase(random: random, detailsfororder: detailsfororder, datefororder: datefororder, CustomerName: CustomerName, Phone: Phone, serviesKind: se.titel, email: (Auth.auth().currentUser?.email)!)
                        
                        showNextPage = true
                    } label: {
                        Text("Pay")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.vertical)
                            .frame(maxWidth: .infinity)
                            .background(Color.black)
                            .cornerRadius(20)
                            .shadow(color: .gray, radius: 2, x: 3, y: 3)
                    }.padding()
                    
                    
                    
                }
                
            }
        }
    }
    func addToDataBase(random: Int, detailsfororder: String, datefororder: Date, CustomerName: String, Phone: String, serviesKind: String, email: String)  {
        let dataBase = Firestore.firestore()
        
        dataBase.collection("order").document().setData([
            "Order Number": random,
            "Details For Order": detailsfororder,
            "date For Order" : datefororder,
            "Customer Name": CustomerName,
            "Phone": Phone,
            "Servies Kind" : serviesKind,
            "email": email,
        ]){ error in
            if let error = error {
                print("Error adding document: \(error)")
            } else {
                print("Document added successfully")
            }
        }
    }
    
    
    struct ExtractedView: View {
        var body: some View {
            VStack{
                HStack{
                    Text("Tools Price :")
                        .font(.title3)
                        .bold()
                    Spacer()
                    Text("15 $")
                        .font(.title3)
                        .bold()
                }.padding()
                HStack{
                    Text("Discount:")
                        .font(.title3)
                        .bold()
                    
                    Spacer()
                    Text("0 $")
                        .font(.title3)
                        .bold()
                    
                }.padding()
                HStack{
                    Text("Total:")
                        .font(.title)
                        .bold()
                        .padding()
                    Spacer()
                    Text("25 $")
                        .font(.title)
                        .bold()
                        .padding()
                }
            }
        }
    }
}




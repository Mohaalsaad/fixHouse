//
//  MyPreviousOrders.swift
//  fixHouse
//
//  Created by Mohammed on 28/11/1444 AH.
//

import SwiftUI

struct MyPreviousOrders: View {
    var order : OrderDetails
    var number = 25
    var body: some View {
        ScrollView {
            VStack {
                
                VStack{
                    Text("My Order")
                        .font(.largeTitle)
                        .bold()
                    HStack{
                        Text("Customer Name:")
                        Spacer()
                        Text(order.CustomerName)
                    }.padding()
                    HStack{
                        Text("Servies Kind:")
                        Spacer()
                        Text(order.serviesKind)
                    }.padding()
                    HStack{
                        Text("Order Number:")
                        Spacer()
                        Text("\(order.OrderNumber)")
                    }.padding()
                    HStack{
                        Text("Date For Order:")
                        Spacer()
                        Text("\(order.datefororder)")
                    }.padding()
                    
                    
                }.padding()
                    .overlay(
                       RoundedRectangle(cornerRadius: 16)
                           .stroke(.gray, lineWidth: 1))
                    .background(.thinMaterial)
                    .cornerRadius(16)
                .padding()
                
                VStack{
                    Text("My Bill")
                        .font(.largeTitle)
                        .bold()
                    HStack{
                        Text("Tools Cost:")
                        Spacer()
                        Text("10 $")
                    }.padding()
                    HStack{
                        Text("Tecnical Cost:")
                        Spacer()
                        Text("10 $")
                    }.padding()
                    HStack{
                        Text("Total Discount:")
                        Spacer()
                        Text("0 $")
                    }.padding()
                    HStack{
                        Text("Total Prise:")
                        Spacer()
                        Text("\(number) $")
                    }.padding()
                    
                    
                }.padding()
                    .overlay(
                       RoundedRectangle(cornerRadius: 16)
                           .stroke(.gray, lineWidth: 1))
                    .background(.thinMaterial)
                    .cornerRadius(16)
                .padding()
            }
        }
    }
}

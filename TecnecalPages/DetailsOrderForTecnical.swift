//
//  DetailsOrderForTecnical.swift
//  fixHouse
//
//  Created by Mohammed on 28/11/1444 AH.
//

import SwiftUI
import UserNotifications


struct DetailsOrderForTecnical: View {
    @State var order: OrderDetails
    var body: some View {
        ScrollView {
            VStack {
                VStack{
                    Text("Order Ditails")
                        .font(.largeTitle)
                        .bold()
                    HStack{
                        Text("Customer Name:")
                        Spacer()
                        Text(order.CustomerName)
                    }.padding()
                    HStack{
                        Text("Customer Number:")
                        Spacer()
                        Text("\(order.phone)")
                    }.padding()
                    HStack{
                        Text("Details:")
                        Spacer()
                        Text("\(order.detailsfororder)")
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
                    
                    Button {
                        let content = UNMutableNotificationContent()
                        content.title = "FixHouse"
                        content.subtitle = "The Tecnical will Come To You "
                        content.sound = UNNotificationSound.default

                        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 3, repeats: false)

                        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

                        UNUserNotificationCenter.current().add(request)
                    } label: {
                        Text("Contact The Applicant")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.vertical)
                            .frame(maxWidth: .infinity)
                            .background(Color("Color2"))
                            .cornerRadius(10)
                            .shadow(color: .gray, radius: 2, x: 3, y: 3)
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

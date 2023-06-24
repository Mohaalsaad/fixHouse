//
//  NotificationPage.swift
//  fixHouse
//
//  Created by Mohammed on 02/12/1444 AH.
//

import SwiftUI
import UserNotifications

struct NotificationPage: View {
    @State var showNextPage = false
    var body: some View {
        if showNextPage == true{
            MyTapBar()
        } else {
          
                VStack{
                    Image("notification")
                        .resizable()
                        .frame(width: 300 , height: 300)
                    Text("Turn on push notifications.")
                        .bold()
                        .font(.title)
                        .padding()
                    Text("Get updates about new maintenance, special offers, appointments and more..")
                        .bold()
                        .font(.title3)
                        .padding()
                        .multilineTextAlignment(.center)
                    Button {
                        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                            if success {
                                print("All set!")
                            } else if let error = error {
                                print(error.localizedDescription)
                            }
                        }
                        showNextPage = true
                        
                    } label: {
                        Text("Allow Notifications")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.vertical)
                            .frame(maxWidth: .infinity)
                            .background(Color("Color2"))
                            .cornerRadius(10)
                            .shadow(color: .gray, radius: 2, x: 3, y: 3)
                    }.padding()
                    NavigationLink {
                        MyTapBar()
                            .navigationBarBackButtonHidden(true)
                    } label: {
                        Text("Skip For Now")
                            .font(.title3)
                            .bold()
                            .foregroundColor(Color("Color2"))
                    }
                    
                    
                    
                }.padding()
            
        }
    }
}
struct NotificationPage_Previews: PreviewProvider {
    static var previews: some View {
        NotificationPage()
    }
}

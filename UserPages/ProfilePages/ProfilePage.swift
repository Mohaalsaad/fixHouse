//
//  ProfilePage.swift
//  fixHouse
//
//  Created by Mohammed on 27/11/1444 AH.
//

import SwiftUI
import FirebaseAuth

struct ProfilePage: View {
    @State var name = ""
    var body: some View {
        NavigationView {
            VStack(alignment: .leading){
                Divider()
                    .padding()
                
                Text("User Email")
                    .bold()
                    .font(.title2)
                    .padding()
                
                List {
                    Section("Account"){
                        NavigationLink(destination: UpdateInformationsPage()) {
                            Text("Personail Info")
                        }
                        NavigationLink(destination: UnderWorking()) {
                            Text("Email Setting")
                        }
                        NavigationLink(destination: UnderWorking()) {
                            Text("Stars History")
                        }
                    }
                    
                    Section("Contact and Policies"){
                        NavigationLink(destination: UnderWorking()) {
                            Text("WhatSapp")
                        }
                        NavigationLink(destination: UnderWorking()) {
                            Text("Linked In")
                        }
                        NavigationLink(destination: UnderWorking()) {
                            Text("Stars History")
                        }
                    }
                }
                
                Button {
//                    signOut()
                } label: {
                    Text("Logout")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(maxWidth: 200)
                        .background(Color.red.opacity(0.5))
                        .cornerRadius(10)
                        .shadow(color: .gray, radius: 2, x: 3, y: 3)
                }.padding()
                
                
            }
            .navigationTitle("Settings")
            .scrollContentBackground(.hidden)
        }
        .accessibilityHidden(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
        .accessibilityIdentifier(/*@START_MENU_TOKEN@*/"Identifier"/*@END_MENU_TOKEN@*/)
    }
    
}

//    func signOut(){
//        let firebaseAuth = Auth.auth()
//        do {
//          try firebaseAuth.signOut()
//            print("sign out")
//        } catch let signOutError as NSError {
//          print("Error signing out: %@", signOutError)
//        }
//    }


struct ProfilePage_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePage()
    }
}



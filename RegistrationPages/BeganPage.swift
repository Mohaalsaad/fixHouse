//
//  BeganPage.swift
//  fixHouse
//
//  Created by Mohammed on 24/11/1444 AH.
//

import SwiftUI

struct BeganPage: View {
    var body: some View {
        NavigationView {
            VStack{
             
                Image("App")
                    .resizable()
                    .frame(width: 150 , height: 150)
                    .padding()
                Text("Discover Our Services Near You")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.gray)
                    .padding()
                NavigationLink {
                    SignUpPage()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    Text("Sign Up")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(maxWidth: .infinity)
                        .background(Color("Color2"))
                        .cornerRadius(10)
                        .shadow(color: .gray, radius: 2, x: 3, y: 3)
                }.padding()
                NavigationLink {
                    LogInPage()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    Text("Login")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(maxWidth: .infinity)
                        .background(Color("Color3"))
                        .cornerRadius(10)
                        .shadow(color: .gray, radius: 2, x: 3, y: 3)
                }.padding()
                
                Divider()
                    .padding()
                NavigationLink {
//                    HomePage()
                } label: {
                    Text("Skip For Now")
                        .fontWeight(.bold)
                        .foregroundColor(Color("Color2"))
                    
                }.padding()

                
            }
        }
        
    }
}

struct BeganPage_Previews: PreviewProvider {
    static var previews: some View {
        BeganPage()
    }
}

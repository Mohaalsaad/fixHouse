//
//  LogInPage.swift
//  fixHouse
//
//  Created by Mohammed on 23/11/1444 AH.
//

import SwiftUI
import FirebaseAuth

struct LogInPage: View {
    
    @State var email = ""
    @State var password = ""
    @State private var isLoggedIn = false
    @State private var showError = false

    var body: some View {
        if isLoggedIn == true{
            NotificationPage()
                .navigationBarBackButtonHidden(true)
        } else{
            NavigationView {
                ZStack{
                        VStack{
                        Image("App")
                            .resizable()
                            .frame(width: 150 , height: 150)
                            .padding()
                        TextField("Email", text: $email)
                            .keyboardType(.emailAddress)
                            .padding()
                            .foregroundColor(.black)
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(showError ? Color.red : Color.gray, lineWidth: 1)
                            )
                        SecureField("Password", text: $password)
                            .padding()
                            .foregroundColor(.black)
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(showError ? Color.red : Color.gray, lineWidth: 1)
                            )
                            if showError {
                                Text("Incorrect email or password⚠️.")
                                    .padding()
                                    .foregroundColor(.red)
                            }
                        NavigationLink {
                           ForgetPasswordPage()
                        } label: {
                            Text("forget Passwored? ")
                                .fontWeight(.bold)
                                .foregroundColor(Color("Color2"))
                            
                        }
                        Button {
                            logIn()
                        } label: {
                            Text("Sign in")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.vertical)
                                .frame(maxWidth: .infinity)
                                .background(Color("Color2"))
                                .cornerRadius(10)
                                .shadow(color: .gray, radius: 2, x: 3, y: 3)
                        }.padding()
                        HStack{
                            Text("________________")
                            Text("or")
                            Text("________________")
                        }.padding()
                        
                        HStack(spacing: 40){
                            Image("gogl")
                                .resizable()
                                .frame(width: 40 , height: 40)
                            
                            Image(systemName: "apple.logo")
                                .resizable()
                                .frame(width: 30 , height: 40)
                        }.padding()
                        
                        HStack{
                            Text("Don't have account?")
                                .fontWeight(.bold)
                                .foregroundColor(.gray)
                            NavigationLink {
                                SignUpPage()
                                    .navigationBarBackButtonHidden(true)
                            } label: {
                                Text("Sign Up")
                                    .fontWeight(.bold)
                                    .foregroundColor(Color("Color2"))
                                
                            }
                        }
                        
                        
                    }.padding()
                }
            }
        }
        
    }
    
    func logIn(){
        Auth.auth().signIn(withEmail: email, password: password) { _, error in
            if let error = error {
                print("Error logging in: \(error.localizedDescription)")
                showError = true
            } else {
                isLoggedIn = true
            }
        }
    }
    
    
}

struct LogInPage_Previews: PreviewProvider {
    static var previews: some View {
        LogInPage()
    }
}

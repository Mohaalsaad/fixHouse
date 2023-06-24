//
//  ForgetPasswordPAge.swift
//  fixHouse
//
//  Created by Mohammed on 23/11/1444 AH.
//

import SwiftUI
import FirebaseAuth

struct ForgetPasswordPage: View {
    @State var email = ""
    var body: some View {
        ZStack{
//            Color("Color1")
//                .ignoresSafeArea()
            VStack{
                Image("forgotPassword")
                    .resizable()
                    .frame(width: 300,height: 300)
                HStack{
                    Text("Forgot Password?")
                        .font(.system(.title).bold())
                        .foregroundColor(Color.black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.top,10)
                
                HStack{
                    Text("Don't worry just enter the email associated with your account and we'll send an email to reset your password")
                        .foregroundColor(Color.black)
                        .font(.system(.caption))
                    
                }
                .padding(.top,10)
                
                
                TextField("Enter your Email", text: $email)
                    .keyboardType(.emailAddress)
                    .padding()
                    .background(Color.cyan.opacity(0.1))
                    .cornerRadius(10)
                    .padding(.bottom, 10)
                    .padding()
                
                Button {
                    forgotPassowrd(email: email)
                } label: {
                    Text("Send The link")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(maxWidth: .infinity)
                        .background(Color("Color2"))
                        .cornerRadius(10)
                        .shadow(color: .gray, radius: 2, x: 3, y: 3)
                }

            }.padding()
        }
    }
    func forgotPassowrd(email:String){
        Auth.auth().sendPasswordReset(withEmail: email){error in
            if let error = error {
                print("the like was not sent!! \(error.localizedDescription)")
            } else {
                print("the link was sent!!!")
            }
        }
        
        
        
        
    }
}

struct ForgetPasswordPage_Previews: PreviewProvider {
    static var previews: some View {
        ForgetPasswordPage()
    }
}

//
//  SignUpPage.swift
//  fixHouse
//
//  Created by Mohammed on 23/11/1444 AH.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore

struct SignUpPage: View {
    @State var email = ""
    @State var password = ""
    @State var repaswword = ""
    @State var showAlert = false
    @State private var showErrorPass = false
    @State private var showErrorEmail = false
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack{
                    Image("App")
                        .resizable()
                        .frame(width: 150 , height: 150)
                        .padding()
                    TextField("Email", text: $email)
                        .padding()
                        .foregroundColor(.black)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(showErrorPass ? Color.red : Color.gray, lineWidth: 1)
                        )
                    SecureField("Password", text: $password)
                        .padding()
                        .foregroundColor(.black)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(showErrorPass ? Color.red : Color.gray, lineWidth: 1)
                        )
                    
                    SecureField("Repassword", text: $repaswword)
                        .padding()
                        .foregroundColor(.black)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(showErrorPass ? Color.red : Color.gray, lineWidth: 1)
                        )
                    if password != repaswword{
                        Text("The Password Dose not Match⚠️.")
                            .foregroundColor(.red)
                    }
                    
                    if showErrorEmail {
                        Text("The Email Already Used⚠️.")
                            .padding()
                            .foregroundColor(.red)
                    }
                    
                    Button{
                        // fire store
            addToDataBase(phone: "pp" , lastName: "mm", firstName: "aa", email: email)
                        
                        // auth
                        signUp()
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
                        Text("Already have account?")
                            .fontWeight(.bold)
                            .foregroundColor(.gray)
                        NavigationLink {
                            LogInPage()
                                .navigationBarBackButtonHidden(true)
                        } label: {
                            Text("Sign in")
                                .fontWeight(.bold)
                                .foregroundColor(Color("Color2"))
                            
                        }
                    }
                    
                    
                }.padding()
            }
        }
    }
    
    func signUp(){
        Auth.auth().createUser(withEmail: email, password: password){ re , errors in
            if errors != nil{
                print(errors!.localizedDescription)
                showErrorEmail = true
            } else {
                print(re!.description)
            }
        }
    }
    
       func addToDataBase(phone: String ,lastName: String , firstName: String , email: String ){
           let dataBase = Firestore.firestore()
           dataBase.collection("users").document().setData([
               "phone" : phone,
               "Full Name" : lastName,
               "first name" : firstName,
               "email" : email
        ])
    
    
       }
    
    
    
}

struct SignUpPage_Previews: PreviewProvider {
    static var previews: some View {
        SignUpPage()
    }
}


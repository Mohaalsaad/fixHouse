//
//  UpdateInformationsPage.swift
//  fixHouse
//
//  Created by Mohammed on 29/11/1444 AH.
//

import SwiftUI
import FirebaseFirestore

struct UpdateInformationsPage: View {
    @State var email = ""
    @State var firstName = ""
    @State var lastName = ""
    @State var phone = ""
    @State var showAlert = false
    
    
    var body: some View {
        VStack{
            Image("AppIcon")
                .resizable()
                .frame(width: 150 , height: 150)
                .padding()
            TextField("Email", text: $email)
                .keyboardType(.emailAddress)
                .padding()
                .foregroundColor(.black)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
            TextField("First Name", text: $firstName)
                .padding()
                .foregroundColor(.black)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
            TextField("Last Name", text: $lastName)
                .padding()
                .foregroundColor(.black)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
            TextField("Phone Number", text: $phone)
                .keyboardType(.numberPad)
                .padding()
                .foregroundColor(.black)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
            
            Button{
                addToDataBase(phone: phone, lastName: lastName, firstName: firstName, email: email)
                showAlert = true
            } label: {
                Text("Update")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.vertical)
                    .frame(maxWidth: .infinity)
                    .background(Color("Color2"))
                    .cornerRadius(10)
                    .shadow(color: .gray, radius: 2, x: 3, y: 3)
            }.alert("Your Information Was Updated", isPresented: $showAlert) {
                Button("OK", role: .cancel) { }
            }
            .padding()
        }.padding()
    }
  
    func addToDataBase(phone: String ,lastName: String , firstName: String , email: String ){
        let dataBase = Firestore.firestore()
        dataBase.collection("users").document().setData([
            "phone" : phone,
            "last Name" : lastName,
            "first name" : firstName,
            "email" : email
     ])
        
        
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

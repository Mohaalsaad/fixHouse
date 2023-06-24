//
//  PaymentPage.swift
//  fixHouse
//
//  Created by Mohammed on 27/11/1444 AH.
//

import SwiftUI
import Combine

struct PaymentPage: View {
    @State var email = ""
    @State var cardInfo = ""
    @State var date = ""
    @State var CVV = ""
    @StateObject var vm = OrderViewModel()
    let textLimit = 3 //Your limit
    let textLimit2 = 16 //Your limit
    
    var body: some View {
        if vm.paymentSuccess{
            DonePage()
                .navigationBarBackButtonHidden(true)
        } else{
            ScrollView {
                VStack{
                    VStack(alignment: .leading){
                        Text( "      Name on Card")
                        
                        TextField("", text: $email)
                            .keyboardType(.emailAddress)
                            .padding()
                            .background(Color.white.opacity(0.9))
                            .cornerRadius(10)
                            .shadow(color: .gray, radius: 2, x: 2, y: 1)
                            .padding()
                    }.padding()
                    VStack(alignment: .leading){
                        Text( "      Card Informatin")
                        
                        HStack{
                            TextField("**** **** **** ****", text: $cardInfo)
                                .onReceive(Just(cardInfo)) { _ in limitText2(textLimit2) }
                                .keyboardType(.emailAddress)
                                .padding()
                                .background(Color.white.opacity(0.9))
                                .cornerRadius(10)
                                .shadow(color: .gray, radius: 2, x: 2, y: 1)
                                .padding()
                            Image("cards")
                                .resizable()
                                .frame(width: 130 , height: 50)
                                .foregroundColor(.gray)
                        }
                        
                        HStack(spacing: 2){
                            TextField("mm/yy", text: $date)
                                .keyboardType(.emailAddress)
                                .padding()
                                .background(Color.white.opacity(0.9))
                                .cornerRadius(10)
                                .shadow(color: .gray, radius: 2, x: 2, y: 1)
                            
                            SecureField("CVV", text: $CVV)
                                .onReceive(Just(CVV)) { _ in limitText(textLimit) }
                                .keyboardType(.emailAddress)
                                .padding()
                                .background(Color.white.opacity(0.9))
                                .cornerRadius(10)
                                .shadow(color: .gray, radius: 2, x: 2, y: 1)
                            
                        }.padding()
                        
                        
                    }.padding()
                    
                    PaymentButton(action: vm.pay)
                    
                    HStack{
                        Text("______________")
                        Text("or")
                        Text("______________")
                    }.foregroundColor(.gray)
                        .padding()
                    
                    
                    
                    
                    Button {
                        // some action
                    } label: {
                        Text("Pay Cash")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.vertical)
                            .frame(maxWidth: .infinity)
                            .background(Color("Color2"))
                            .cornerRadius(10)
                            .shadow(color: .gray, radius: 2, x: 3, y: 3)
                    }.padding()
                    Text("You can pay cash when the Tecnical comes to you. ")
                        .padding()
                        .multilineTextAlignment(.center)
                        .overlay(
                            
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(.gray, lineWidth: 1)
                                .shadow(color: .gray, radius: 1, x: 1, y: 1))
                        .padding()
                    
                }
            }
        }
    }
    
  
    
    func limitText(_ upper: Int) {
        if CVV.count > upper {
            CVV = String(CVV.prefix(upper))
        }
    }
    func limitText2(_ upper: Int) {
        if cardInfo.count > upper {
            cardInfo = String(cardInfo.prefix(upper))
        }
    }
}
struct PaymentPage_Previews: PreviewProvider {
    static var previews: some View {
        PaymentPage()
    }
}




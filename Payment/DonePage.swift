//
//  DonePage.swift
//  fixHouse
//
//  Created by Mohammed on 01/12/1444 AH.
//

import SwiftUI

struct DonePage: View {
    var body: some View {
        NavigationStack {
            VStack{
             
                Image("Done")
                    .resizable()
                    .frame(width: 400 , height: 400)
                Text("Thank You , The Tecnicail Will Contact You  ")
                    .multilineTextAlignment(.center)
                    .bold()
                    .font(.largeTitle)
                
                NavigationLink {
                    MyTapBar()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    Text("Back To Home Page")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(maxWidth: .infinity)
                        .background(Color("Color2"))
                        .cornerRadius(10)
                        .shadow(color: .gray, radius: 2, x: 3, y: 3)
                }.padding()
                
                
            }
        }
    }
}

struct DonePage_Previews: PreviewProvider {
    static var previews: some View {
        DonePage()
    }
}

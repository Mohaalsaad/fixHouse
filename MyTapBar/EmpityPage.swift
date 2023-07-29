//
//  EmpityPage.swift
//  fixHouse
//
//  Created by Mohammed on 02/12/1444 AH.
//

import SwiftUI

struct EmpityPage: View {
    var body: some View {
        VStack{
            Image("embty")
                .resizable()
                .frame(width: 350 , height: 450 )
            Text("You don't have orders")
                .font(.title)
                .foregroundColor(.gray)
                .bold()
        }
        
    }
}
struct EmpityPage_Previews: PreviewProvider {
    static var previews: some View {
        EmpityPage()
    }
}

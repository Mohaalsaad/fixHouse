//
//  AllOrderPage.swift
//  fixHouse
//
//  Created by Mohammed on 25/11/1444 AH.
//

import SwiftUI

struct AllOrderPage: View {
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack{
                    CustomFowForAllOrders()
                }
            }
        }.navigationTitle("All Orders")
    }
}
    struct AllOrderPage_Previews: PreviewProvider {
        static var previews: some View {
            AllOrderPage()
        }
    }

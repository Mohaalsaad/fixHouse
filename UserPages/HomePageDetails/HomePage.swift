//
//  HomePage.swift
//  fixHouse
//
//  Created by Mohammed on 24/11/1444 AH.
//

import SwiftUI

struct HomePage: View {
    var body: some View {
        ZStack {
            Image("BG1")
                .resizable()
                .ignoresSafeArea()
            VStack(alignment: .leading){
               
                HStack{
                    Text("Welcom")
                        .font(.title2)
                        .bold()
                        .padding()
                }
                MyRowsForServies()
                
            }
        }
    }
}
struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}








//
//  CustomRow.swift
//  fixHouse
//
//  Created by Mohammed on 24/11/1444 AH.
//

import SwiftUI

struct CustomRow: View {
    var servies: Servies
    @State var selectedRow: Servies?
    @State private var showDetail = false
    var body: some View {
        VStack(spacing: 10){
            HStack{
                Image(servies.image)
                    .resizable()
                    .frame(width: 150 , height: 150)
                Spacer()
                VStack(alignment: .center){
                    Text(servies.titel)
                        .font(.system(size: 20, weight: .light))
                        .bold()
                        .padding()
                    Text(servies.details)
                        .font(.system(size: 13, weight: .light))
                        .multilineTextAlignment(.center)
                }
            }.padding()
                .onTapGesture {
                    selectedRow = servies
                    self.showDetail = true
                }
                .sheet(item: $selectedRow){ i in
                    ServiesDetailsPage(servies: i)
                    
                }
        }
        .background(.thinMaterial)
        .cornerRadius(16)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(.gray, lineWidth: 1)
                .shadow(color: .gray, radius: 2, x: 3, y: 3))
        .padding()
        
    }
}

struct CustomRow_Previews: PreviewProvider {
    static var previews: some View {
        CustomRow(servies: allServies[0])
    }
}




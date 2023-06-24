//
//  HomPageForTecnicail.swift
//  fixHouse
//
//  Created by Mohammed on 28/11/1444 AH.
//

import SwiftUI

struct HomPageForTecnicail: View {
    var body: some View {
        ZStack {
            Image("BG1")
                .resizable()
                .ignoresSafeArea()
            VStack(alignment: .leading){
                HStack{
                }
                CustomRowForTecnicail()                
            }
        }
    }
}
struct HomPageForTecnicail_Previews: PreviewProvider {
    static var previews: some View {
        HomPageForTecnicail()
    }
}

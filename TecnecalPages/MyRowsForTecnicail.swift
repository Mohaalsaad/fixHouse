//
//  MyRowsForTecnicail.swift
//  fixHouse
//
//  Created by Mohammed on 28/11/1444 AH.
//

import SwiftUI

struct MyRowsForTecnicail: View {
    var body: some View {
        ZStack {
            VStack{
                ScrollView{
                    ForEach(allServies , id: \.id){ i in
                       
                        
                    }
                }
            }
        }
    }
}
struct MyRowsForTecnicail_Previews: PreviewProvider {
    static var previews: some View {
        MyRowsForTecnicail()
    }
}

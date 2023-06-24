//
//  MyRowsForServies.swift
//  fixHouse
//
//  Created by Mohammed on 24/11/1444 AH.
//

import SwiftUI


struct MyRowsForServies: View {
    var body: some View {
        VStack{
            ScrollView {
                ForEach(allServies , id: \.id){ i in
                    CustomRow(servies: i)
                    
                }
            }
        }
    }
}

struct MyRowsForServies_Previews: PreviewProvider {
    static var previews: some View {
        MyRowsForServies()
    }
}

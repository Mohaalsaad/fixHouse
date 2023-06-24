//
//  ChatView.swift
//  SideMenuSwiftUI
//
//  Created by Zeeshan Suleman on 04/03/2023.
//

import SwiftUI

struct ChatView: View {
    
    @Binding var presentSideMenu: Bool
    
    var body: some View {
        VStack{
            HStack{
                Button{
                    presentSideMenu.toggle()
                } label: {
                    Image(systemName: "list.bullet")
                        .resizable()
                        .frame(width: 25, height: 20)
                        .foregroundColor(.black)
                }.padding()
                Spacer()
            }
            
            Spacer()
            Text("Chat View")
            Spacer()
        }
        .padding(.horizontal, 24)
    }
}

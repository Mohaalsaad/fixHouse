//
//  ProfileView.swift
//  SideMenuSwiftUI
//
//  Created by Mohammed. on 04/03/2023.
//

import SwiftUI

struct ProfileView: View {
    
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
            Text("Profile View")
            Spacer()
        }
        .padding(.horizontal, 24)
    }
}

//
//  MyTapBarPage.swift
//  fixHouse
//
//  Created by Mohammed on 24/11/1444 AH.
//

import SwiftUI

struct MyTapBarPage: View {
    var body: some View {
        ZStack {
            Image("BG1")
                .resizable()
                .ignoresSafeArea()
            VStack {
                TabView{
                    HomePage()
                        .tabItem {
                            Label("Menu", systemImage: "house")
                        }
                    
                    AllOrderPage()
                        .tabItem {
                            Label("Orders", systemImage: "list.bullet.rectangle.portrait.fill")
                        }
                }
            }
        }
        
    }
}
struct MyTapBarPage_Previews: PreviewProvider {
    static var previews: some View {
        MyTapBarPage()
    }
}

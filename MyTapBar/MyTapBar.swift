//
//  MyTapBar.swift
//  fixHouse
//
//  Created by Mohammed on 26/11/1444 AH.
//

import SwiftUI

struct MyTapBar: View {
    @State private var activeTab: Tab = . home
    @Namespace private var animation
    @StateObject var vm = OrderViewModel()

    init(){UITabBar.appearance () . isHidden = true}
    
    var body: some View {
        VStack{
            TabView(selection: $activeTab){
                HomePage()
                    .tag(Tab.home)
                
                ProfilePage()
                    .tag(Tab.more)
                
                CustomFowForAllOrders()
                    .tag(Tab.allOrder)
                
            }
            CustomTabBar()
        }
    }
    
    
    @ViewBuilder
    func CustomTabBar(_ tint: Color = Color.cyan, _ inactiveTint: Color = .blue) ->   some View {
        HStack(alignment: .bottom){
            ForEach(Tab.allCases , id: \.rawValue){
                TabItem(tint: tint,
                        inactiveTint: inactiveTint,
                        tab: $0 ,
                        animation: animation,
                        activeTab: $activeTab)
            }
        }.background(content: {
            Rectangle()
                .foregroundColor(Color.white)
                .cornerRadius(30)
                .ignoresSafeArea()
                .shadow(color: tint.opacity(0.2), radius: 5, x: 0, y: -5)
        })
        .animation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration:
                                        0.7), value: activeTab)
    }
}

struct MyTapBar_Previews: PreviewProvider {
    static var previews: some View {
        MyTapBar()
    }
}

struct TabItem: View {
    var tint: Color
    var inactiveTint: Color
    var tab: Tab
    var animation: Namespace.ID
    @Binding var activeTab: Tab
    
    var body: some View{
        VStack{
            Image(systemName: tab.systemImage)
                .font (.title2)
                .foregroundColor (activeTab == tab ? .white : .cyan)
                .frame(width: activeTab == tab ? 58 : 35, height: activeTab == tab ? 58: 35)
                .background {
                    if activeTab == tab {
                        Circle()
                            .fill(tint.gradient)
                            .matchedGeometryEffect(id: "ACTIVETAB", in: animation)
                    }
                }
            
            Text(tab.rawValue)
                .font(.caption)
                .foregroundColor(activeTab == tab ? tint : .gray)
            
            
        }
        .frame(maxWidth: .infinity)
        .contentShape (Rectangle () )
        .onTapGesture {
            activeTab = tab
            
        }
    }
}

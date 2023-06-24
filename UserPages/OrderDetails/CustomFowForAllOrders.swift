//
//  CustomFowForAllOrders.swift
//  fixHouse
//
//  Created by Mohammed on 25/11/1444 AH.
//

import SwiftUI

struct CustomFowForAllOrders: View {
    @StateObject var vm = OrderViewModel()
    @State private var searchText = ""
    @State private var showView = false
    @State private var selectefOrder: OrderDetails?
    var body: some View {
        NavigationView {
            VStack{
                if vm.myOrder.isEmpty{
                   // EmpityPage()
                    Text("Nothng Add")
                } else{
                    ScrollView {
                        ForEach(vm.myOrder , id:\.id){ i in
                            HStack{
                                Text("# \(i.OrderNumber)")
                                Spacer()
                                Text("\(i.serviesKind)")
                            }.padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(.gray, lineWidth: 1)
                                    .shadow(color: .gray, radius: 2, x: 3, y: 3))
                             .background(.thinMaterial)
                             .cornerRadius(16)
                             .padding()
                            .onTapGesture {
                                selectefOrder = i
                                showView = true
                                
                            }

                        }
                        .sheet(item: $selectefOrder){ i in
                            MyPreviousOrders(order: i)
                            
                        }
                         .padding()
                         

                    }
                }
                
            }
            .searchable(text: $searchText, prompt: "Look for something")
                .navigationTitle("My Orders")
            
        }
    }
}

struct CustomFowForAllOrders_Previews: PreviewProvider {
    static var previews: some View {
        CustomFowForAllOrders()
    }
}

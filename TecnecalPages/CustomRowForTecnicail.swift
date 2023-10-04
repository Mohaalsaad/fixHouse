//
//  CustomRowForTecnicail.swift
//  fixHouse
//
//  Created by Mohammed on 28/11/1444 AH.
//

import SwiftUI


struct CustomRowForTecnicail: View {
    @StateObject var vm = TecnicalViewModel()
    @State private var showView = false
    @State private var selectefOrder: OrderDetails?
    var body: some View {
        NavigationView {
            ZStack {
                Image("BG1")
                    .resizable()
                    .ignoresSafeArea()
                VStack{
                    ScrollView {
                        ForEach(vm.Orders , id: \.id){i in
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
                                .cornerRadius(16).onTapGesture {
                                    selectefOrder = i
                                    showView = true
                                    
                                }
                        }
                        .sheet(item: $selectefOrder){ i in
                            DetailsOrderForTecnical(order: i)
                        }
                    }
                }.scrollContentBackground(.hidden)
                    .navigationTitle("All Orders")
                    .padding()
            }
        }
    }
}

struct CustomRowForTecnicail_Previews: PreviewProvider {
    static var previews: some View {
        CustomRowForTecnicail()
    }
}

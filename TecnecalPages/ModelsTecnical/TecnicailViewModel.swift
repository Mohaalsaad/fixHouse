//
//  TecnicailViewModel.swift
//  fixHouse
//
//  Created by Mohammed on 28/11/1444 AH.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

@MainActor class TecnicalViewModel : ObservableObject{
    @Published var Orders : [OrderDetails] = []
    let dataBase = Firestore.firestore()
    
    
    init() {
        listenToDataBase()
    }
    
    
    func listenToDataBase() {
        dataBase.collection("order")
            .addSnapshotListener { (querySnapshot, error) in
                if let error = error {
                    print("Error getting documents: \(error.localizedDescription)")
                } else {
                    self.Orders = []
                    for document in querySnapshot!.documents {
                        let data = document.data()
                        let CustomerName = data["Customer Name"] as? String ?? ""
                        let serviesKind = data["Servies Kind"] as? String ?? ""
                        let detailsfororder = data["Details For Order"] as? String ?? ""
                        let OrderNumber = data["Order Number"] as? Int ?? 0
                        let phone = data["Phone"] as? String ?? ""
                        let email = data["email"] as? String ?? ""
                        let datefororder = data["date For Order"] as? Date ?? Date.now
                        let all = OrderDetails(CustomerName: CustomerName,
                                               OrderNumber: OrderNumber,
                                               phone: phone,
                                               datefororder: datefororder,
                                               serviesKind: serviesKind,
                                               detailsfororder: detailsfororder,
                                               email: email)
                        self.Orders.append(all)
                       
                        
                    }
                }
            }
    }
    
}


//
//  OrderDetailesViewModel.swift
//  fixHouse
//
//  Created by Mohammed on 25/11/1444 AH.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth


@MainActor class OrderViewModel : ObservableObject{
    @Published var myOrder : [OrderDetails] = []
    
    @Published private(set) var total: Int = 0
    let dataBase = Firestore.firestore()
    let paymentHandler = PaymentHandler()
    
    @Published var paymentSuccess = false
    func pay() {
        paymentHandler.startPayment(products: myOrder, total: 25) { success in
            self.paymentSuccess = success
            self.myOrder = []
            self.total = 0
        }
    }

    init() {
        listenToDataBase()
    }
    
    func listenToDataBase() {
        let fieldName = "email"
        let fieldValue = Auth.auth().currentUser?.email
    
        dataBase.collection("order")
            .whereField(fieldName, isEqualTo: fieldValue!)
            .addSnapshotListener { (querySnapshot, error) in
            if let error = error {
                print("Error getting documents: \(error.localizedDescription)")
            } else {
                self.myOrder = []
                for document in querySnapshot!.documents {
                    let data = document.data()
                    let CustomerName = data["Customer Name"] as? String ?? ""
                    let serviesKind = data["Servies Kind"] as? String ?? ""
                    let detailsfororder = data["Details For Order"] as? String ?? ""
                    let random = data["Order Number"] as? Int ?? 0
                    let phone = data["Phone"] as? String ?? ""
                    let email = data["email"] as? String ?? ""
                    let datefororder = data["date For Order"] as? Date ?? Date.now
                    let all = OrderDetails(CustomerName: CustomerName,
                                           OrderNumber: random,
                                           phone: phone,
                                           datefororder: datefororder,
                                           serviesKind: serviesKind,
                                           detailsfororder: detailsfororder,
                                           email: email)
                    self.myOrder.append(all)
                    
                }
            }
        }
    }
}

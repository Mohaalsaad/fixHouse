//
//  OrderDetailsModel.swift
//  fixHouse
//
//  Created by Mohammed on 24/11/1444 AH.
//

import Foundation


struct OrderDetails: Identifiable{
    var id = UUID()
    var CustomerName: String
    var OrderNumber: Int
    var phone: String
    var datefororder : Date
    var serviesKind: String
    var detailsfororder: String
    var email: String
}

struct UserDetails : Identifiable{
    var id: String
    var userName: String
    var image : String
}


struct Servies : Identifiable{
    var id = UUID()
    var image: String
    var titel: String
    var details: String
}
let allServies : [Servies] = [
    Servies(image: "se1", titel: "Electricity ", details: "Provides many special services for periodic electrical maintenance"),
    Servies(image: "se2", titel: "Kitchen Divices", details: "For the maintenance of all household appliances for kitchens, such as refrigerators, etc"),
    Servies(image: "se3", titel: "Plumbing", details: "All home plumbing services"),
    Servies(image: "se5", titel: "Appliances", details: "Maintenance of any kind of household appliances that need simple maintenance"),
    Servies(image: "se4", titel: "Carpentry", details: "All services related to home gardens are external, inside or outside the house"),
    Servies(image: "se6", titel: "Other Servies", details: "Any service or maintenance to any kind of home services"),
]

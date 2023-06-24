//
//  LocationModel.swift
//  fixHouse
//
//  Created by Mohammed on 27/11/1444 AH.
//

import Foundation


struct Location: Identifiable, Codable, Equatable {
    let id: UUID
    var name: String
    var description: String
    let latitude: Double
    let longitude: Double
}

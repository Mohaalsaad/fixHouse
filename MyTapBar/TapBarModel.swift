//
//  TapBarModel.swift
//  fixHouse
//
//  Created by Mohammed on 26/11/1444 AH.
//

import Foundation

enum Tab: String, CaseIterable {
    case home = "Home"
    case allOrder = "All Order"
    case more = "More"

    
    
    var systemImage: String {
        switch self {
        case .home:
            return "house"
        case .allOrder:
            return "bag"
        case .more:
            return "ellipsis"
        }
    }
    
    var index: Int {
        return Tab.allCases.firstIndex (of: self) ?? 0
    }
    
}



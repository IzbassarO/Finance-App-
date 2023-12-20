//
//  CategoryModel.swift
//  finance app
//
//  Created by Izbassar on 05.12.2023.
//

import Foundation

enum Category: String, CaseIterable {
    case car
    case coffee
    case entertainment
    case house
    case phone
    case money
    case restaurant
}

extension Category {
    var customImage: String {
        switch self {
        case .car:
            "Car"
        case .coffee:
            "Cofee"
        case .entertainment:
            "Entertainment"
        case .house:
            "House"
        case .phone:
            "Phone"
        case .money:
            "Money"
        case .restaurant:
            "Restaurant"
        }
    }
}

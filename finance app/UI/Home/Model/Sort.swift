//
//  Sort.swift
//  finance app
//
//  Created by Izbassar on 02.12.2023.
//

import Foundation

enum SortOption: String, CaseIterable {
    case price
    case date
    case category
}

extension SortOption {
    
    var systemImage: String {
        switch self {
        case .price:
            "dollarsign"
        case .date:
            "calendar"
        case .category:
            "folder"
        }
    }
}

//
//  Currencies.swift
//  finance app
//
//  Created by Izbassar on 05.12.2023.
//

import Foundation

enum CurrenciesError: LocalizedError {
    case notFounded
    
    var errorDescription: String {
        switch self {
        case .notFounded:
            return "currencieserror_notfounded"
        }
    }
}

//
//  Currency.swift
//  finance app
//
//  Created by Izbassar on 03.12.2023.
//

import Foundation

/// Currency Number Formatter
let currencyFormatter: NumberFormatter = {
    let formatter = NumberFormatter()
    formatter.allowsFloats = false
    formatter.internationalCurrencySymbol = "$"
    return formatter
}()

struct Currency: Identifiable, Hashable {
    let fullName: String
    let littleName: String
    let systemName: String?
    let id = UUID()
    
    /// Find currency by code
    static func findByCode(array: [Currency], code: String) -> Currency {
        if let currency = array.first(where: { currency in return currency.littleName == code }) {
            return currency
        }
        return Currency.findByCode(array: Currencies.currenciesAll, code: code)
    }
    
    /// Find currency by id
    static func findById(array: [Currency], id: UUID) throws -> Currency {
        if let currency = array.first(where: { currency in return currency.id == id }) {
            return currency
        }
        throw CurrenciesError.notFounded
    }
    
    static func findByCodeSystemname(array: [Currency], code:  String) -> String {
        if let currency = array.first(where: {currency in return currency.littleName == code}) {
            return currency.systemName ?? code
        }
        return code
    }
}

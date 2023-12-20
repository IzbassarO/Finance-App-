//
//  CurrencyViewModel.swift
//  finance app
//
//  Created by Izbassar on 03.12.2023.
//

import Foundation
import SwiftUI

class CurrencyViewModel: ObservableObject {
    @AppStorage("currency_type") var currencyType: String?
    @Published private(set) var currenciesFiltered: [Currency] = []
    @Published private(set) var isLoading: Bool = true
    
    func loadData() {
        DispatchQueue.main.async {
            self.isLoading = false
            self.updateFilter(filterString: "")
        }
    }
    
    func setCurrency(id: UUID) {
        do {
            let currency = try Currency.findById(array: Currencies.currenciesAll, id: id)
            setPriceType(type: currency.littleName)
        } catch let error {
            let localized = error.localizedDescription
            print("Some issues with the currency set ", localized)
        }
    }
    
    func setPriceType(type: String) {
        currencyType = type
    }
    
    /// Update filtered currencies list
    func updateFilter(filterString: String) {
        if filterString == "" {
            // set to all
            self.currenciesFiltered = Currencies.currenciesAll
            return
        }
        
        // clean
        currenciesFiltered.removeAll()
        
        Task.init {
            Currencies.currenciesAll.forEach { currency in
                if currency.fullName.lowercased().contains(filterString.lowercased()) ||
                    currency.littleName.lowercased().contains(filterString.lowercased()) {
                    currenciesFiltered.append(currency)
                }
            }
        }
    }
}

//
//  HomeViewModel.swift
//  finance app
//
//  Created by Izbassar on 03.12.2023.
//

import Foundation
import Combine
import SwiftUI
import CoreData

class HomeViewModel: ObservableObject {
    @Published var selectedSortOption: String = ""
    @Published var sortDescriptor: NSSortDescriptor?
    @Published var addExpense: Bool = false
    @AppStorage("firstname") var firstname: String!
    @AppStorage("currency_type") var currencyType: String!
    @AppStorage("money") var money: Int!
    @Published var currency: Currency = Currencies.currenciesAll[0]
    
    func loadData() {
        currency = Currency.findByCode(array: Currencies.currenciesAll, code: currencyType)
    }
    
    func totalToday(_ isExpense: Bool, expense: FetchedResults<Purchase>) -> Double {
        var expensesToday: Double = 0
        for item in expense {
            if item.isIncome == isExpense  {
                expensesToday += item.amountSpent
                //if Calendar.current.isDateInToday(item.dateOfPurchase!) {}
            }
        }
        
        return expensesToday
    }
    func deleteExpense(offsets: IndexSet, context: NSManagedObjectContext, expense: FetchedResults<Purchase>) {
        withAnimation {
            offsets.map {expense[$0] }.forEach(context.delete)
            
            DataController().save(context: context)
        }
    }
}

//
//  AddExpenseViewModel.swift
//  finance app
//
//  Created by Izbassar on 05.12.2023.
//

import Foundation
import Combine
import SwiftUI
import CoreData

class AddExpenseViewModel: ObservableObject {
    @Published var isError: Bool = false
    @Published var errorText = ""
    @Published var title = ""
    @Published var amount: Double = 0
    @Published var isIncome: Bool = false
    @Published var category: Category = Category.money
    @AppStorage("money") var money: Int!
    
    func loadData() {
        
    }
    
    func addExpense(context: NSManagedObjectContext) {
        DataController().addExpense(title: title, amount: amount, isIncome: isIncome, category: category, context: context)
        money += Int(isIncome ? amount : -amount)
    }
    
    func tryAddExpense(context: NSManagedObjectContext,onSuccess: () -> Void) {
        /// Check Validation
        if !PriceExpressionValidator.validate(str: amount) {
            errorText = MathExpressionError.invalidExpression.errorDescription
            isError = true
        }
        let mathExp = MathematicalExpression(line: amount)
        do {
            amount = Double(try mathExp.check())
            addExpense(context: context)
            
            onSuccess()
        } catch let error {
            print(error)
            
            errorText = error.localizedDescription
            isError = true
        }
    }
    func showError() { isError = true }
}

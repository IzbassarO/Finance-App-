//
//  DataController.swift
//  finance app
//
//  Created by Izbassar on 01.12.2023.
//

import Foundation
import CoreData
class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "Model")
    
    init() {
        container.loadPersistentStores {desc, error in
            if let error = error {
                print("Failed to load the data \(error.localizedDescription)")
            }
        }
    }
    
    func save(context: NSManagedObjectContext) {
        do {
            try context.save()
        } catch {
            print("Data is not saved \(error.localizedDescription)")
        }
    }
    
    func addExpense(title: String, amount: Double, isIncome: Bool, category: Category, context: NSManagedObjectContext) {
        let expense = Purchase(context: context)
        expense.id = UUID()
        expense.dateOfPurchase = Date()
        if title == "" {
            expense.title = isIncome ? "New Income" : "New Expense"
        } else {
            expense.title = title
        }
        expense.amountSpent = amount
        expense.dateCreated = Date()
        expense.isIncome = isIncome
        expense.category = category.rawValue
        
        save(context: context)
    }
    
    func editExpense(expense: Purchase, title: String, amount: Double, category: Category, date: Date, context: NSManagedObjectContext) {
        expense.dateOfPurchase = date
        expense.title = title
        expense.amountSpent = amount
        expense.dateCreated = Date()
        expense.category = category.rawValue
        
        save(context: context)
    }
    
    func delete(context: NSManagedObjectContext, expense: Purchase) {
        context.delete(expense)
        save(context: context)
    }
}

//
//  EditExpenseView.swift
//  finance app
//
//  Created by Izbassar on 02.12.2023.
//

import SwiftUI

struct EditExpenseView: View {
    @Environment(\.managedObjectContext) var context
    @Environment(\.dismiss) var dismiss
    
    var expense: FetchedResults<Purchase>.Element
    
    @State private var title = ""
    @State private var amount: Double = 0
    @State private var date: Date = Date()
    @State private var category: Category = .money
    
    @AppStorage("money") var money: Int!
    
    var body: some View {
            List {
                Section("Title") {
                    TextField("\(expense.title ?? "")", text: $title)
                        .onAppear {
                            title = expense.title ?? ""
                            amount = expense.amountSpent
                        }
                }
                
                Section("Amount Spent") {
                    TextField(value: $amount, formatter: currencyFormatter) {
                    }
                    .labelsHidden()
                    .keyboardType(.numberPad)
                    
                    HStack {
                        Picker("Category", selection: $category) {
                            ForEach(Category.allCases, id: \.self) { input in
                                Text("\(input.rawValue)")
                            }
                        }
                    }

                }
                
                HStack {
                    Spacer()
                    Button("Submit") {
                        DataController().editExpense(expense: expense, title: title, amount: amount, category: category, date: date, context: context)
                        dismiss()
                    }
                    Spacer()
                }
                
                HStack {
                    Spacer()
                    Button("Delete") {
                        money += Int(expense.isIncome ? -expense.amountSpent : expense.amountSpent)
                        DataController().delete(context: context, expense: expense)
                    }
                    Spacer()
                }
            }
            .navigationBarTitleDisplayMode(.inline)
    }
}

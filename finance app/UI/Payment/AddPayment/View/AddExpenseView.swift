//
//  AddExpenseView.swift
//  finance app
//
//  Created by Izbassar on 01.12.2023.
//

import SwiftUI

struct AddExpenseView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.managedObjectContext) var context
    @ObservedObject var viewModel: AddExpenseViewModel = AddExpenseViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                Section("Details") {
                    HStack {
                        VStack(alignment: .center) {
                            Text("$")
                                .font(.system(size: 16))
                                .foregroundStyle(Color("CustomBlack"))
                            Toggle("", isOn: $viewModel.isIncome)
                                .frame(alignment: .leading)
                        }
                        .frame(width: 20)
                        TextField("0" ,value: $viewModel.amount, formatter: currencyFormatter) {
                        }
                        .labelsHidden()
                        .font(.largeTitle)
                        .bold()
                        .foregroundStyle(viewModel.isIncome ? Color("CustomGreen") : Color("CustomRed"))
                        .keyboardType(.numberPad)
                        .multilineTextAlignment(.trailing)
                    }
                    HStack {
                        Text("Title")
                            .font(.system(size: 16))
                            .foregroundStyle(Color("CustomBlack"))
                        
                        Spacer()
                        
                        TextField("Type here", text: $viewModel.title)
                            .multilineTextAlignment(.trailing)
                            .background(.white.opacity(0.5))
                            .textFieldStyle(PlainTextFieldStyle())
                            .padding(.vertical, 3)
                    }
                    HStack {
                        Picker("Category", selection: $viewModel.category) {
                            ForEach(Category.allCases, id: \.self) { input in
                                Text("\(input.rawValue)")
                            }
                        }
                    }
                    HStack {
                        Text("Date")
                        Spacer()
                        Text("Today")
                            .foregroundStyle(Color("CustomGreen"))
                    }
                }
            }
            .navigationTitle(viewModel.isIncome ? "Income" : "Expense")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        viewModel.tryAddExpense(context: context) {
                            dismiss()
                        } 
                    } label: {
                        Text("Add")
                            .foregroundStyle(Color("CustomGreen"))
                    }
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Cancel")
                            .foregroundStyle(Color("CustomGreen"))
                    }
                }
            }
            .toast(message: viewModel.errorText, isShowing: $viewModel.isError, config: .init(isError: true))
            .onAppear {
                viewModel.loadData()
            }
        }
    }
}

#Preview {
    AddExpenseView()
}

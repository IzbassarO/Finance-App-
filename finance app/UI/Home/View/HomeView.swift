//
//  HomeView.swift
//  finance app
//
//  Created by Izbassar on 01.12.2023.
//

import SwiftUI
import CoreData

struct HomeView: View {
    @State private var addExpense: Bool = false
    @FetchRequest(sortDescriptors: [SortDescriptor(\Purchase.dateCreated, order: .reverse)]) var expense: FetchedResults<Purchase>
    @Environment(\.managedObjectContext) var context
    //Search Text
    @State private var searchText: String = ""
    @ObservedObject private var viewModel: HomeViewModel = HomeViewModel()
    var titleList: [String] {
        let list = expense.map { $0.title?.lowercased() ?? ""}
        return searchText == "" ? list : list.filter {
            $0.contains(searchText.lowercased())
        }
    }
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .leading, content: {
                ScrollView {
                    HeadView(
                        currency: viewModel.currency,
                        money: viewModel.money
                    )
                    
                    HStack(spacing: 6) {
                        HStack {
                            Text("Expenses:")
                            Text("\(Int(viewModel.totalToday(false, expense: expense)))")
                            Text("Income:")
                            Text("\( Int(viewModel.totalToday(true, expense: expense)))")
                        }
                        .font(.headline)
                        .foregroundStyle(.white)
                        
                        Spacer()
                        
                        Menu {
                            Picker("", selection: $viewModel.selectedSortOption) {
                                ForEach(SortOption.allCases, id: \.rawValue) { option in
                                    Label(option.rawValue.capitalized, systemImage: option.systemImage)
                                        .tag(option)
                                }
                            }
                            .labelsHidden()
                        } label: {
                            Image(systemName: "chevron.down")
                                .symbolVariant(.circle)
                                .tint(.white)
                        }
                    }
                    .padding(.top, 50)
                    
                    /// Displaying Purchased Items
                    if !titleList.isEmpty {
                        ForEach(titleList.indices, id: \.self) { index in
                            let purchase = expense.first(where: { $0.title?.lowercased() == titleList[index] })
                            if let purchase = purchase {
                                ExpenseItem(purchase: purchase, currency: viewModel.currency)
                                    .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                                        Button {
                                            context.delete(purchase)
                                        } label: {
                                            Image(systemName: "trash")
                                        }
                                        .tint(.red)
                                    }
                            }
                        }
                        .background {
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .fill(.white)
                        }
                    } else {
                        VStack(alignment: .center, spacing: 10) {
                            Text("Empty Data")
                                .foregroundStyle(.white)
                        }
                    }
                }
                .listStyle(.plain)
                .navigationTitle("Main")
                .navigationBarTitleDisplayMode(.inline)
                .searchable(text: $searchText, placement: .navigationBarDrawer, prompt: Text("Search"))
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            addExpense.toggle()
                        } label: {
                            Image(systemName: "plus")
                        }
                    }
                }
                .fullScreenCover(isPresented: $addExpense, content: {
                    AddExpenseView()
                        .presentationDragIndicator(.hidden)
                        .interactiveDismissDisabled()
                })
                .padding(.horizontal)
                .onAppear {
                    viewModel.loadData()
                }
            })
            .toolbarBackground(.automatic, for: .navigationBar)
            //            .toolbarBackground(viewModel.money >= 0 ? Color("CustomGreen") : Color("CustomRed"), for: .navigationBar)
            .background(viewModel.money >= 0 ? Color("CustomGreen") : Color("CustomRed"))
        }
    }
}

#Preview {
    ContentView()
}

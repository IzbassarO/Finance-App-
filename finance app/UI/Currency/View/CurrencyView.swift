//
//  CurrencyView.swift
//  finance app
//
//  Created by Izbassar on 03.12.2023.
//

import SwiftUI

struct CurrencyView: View {
    @State private var searchText: String = ""
    @ObservedObject var viewModel: CurrencyViewModel = CurrencyViewModel()
    
    var titleList: [String] {
        let list = Currencies.currenciesAll.map { $0.fullName.lowercased() }
        return searchText == "" ? list : list.filter {
            $0.contains(searchText.lowercased())
        }
    }
    
    var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView()
            } else {
                List {
                    if searchText == "" {
                        Section {
                            ForEach(Currencies.currenciesPopular, id: \.self) { curr in
                                if titleList.contains(searchText.lowercased()) || searchText.isEmpty {
                                    Button {
                                        viewModel.setCurrency(id: curr.id)
                                    } label: {
                                        HStack {
                                            Text(curr.fullName)
                                                .foregroundStyle(.black)
                                            Text(curr.littleName)
                                                .foregroundStyle(.gray)
                                            Spacer()
                                            if viewModel.currencyType == curr.littleName {
                                                Image(systemName: "checkmark")
                                                    .foregroundStyle(.blue)
                                                    .transition(.opacity)
                                            }
                                        }
                                    }
                                }
                            }
                        } header: {
                            Text("Popular")
                        }
                    }
                    
                    if viewModel.currenciesFiltered.isEmpty {
                        Text("Not Found")
                    } else {
                        // all
                        Section {
                            ForEach(viewModel.currenciesFiltered, id: \.self) { curr in
                                Button {
                                    viewModel.setCurrency(id: curr.id)
                                } label: {
                                    HStack {
                                        Text(curr.fullName)
                                            .foregroundStyle(.black)
                                        Text(curr.littleName)
                                        Spacer()
                                        if viewModel.currencyType == curr.littleName {
                                            Image(systemName: "checkmark")
                                                .foregroundStyle(.blue)
                                                .transition(.opacity)
                                        }
                                    }
                                }
                                
                            }
                        } header: {
                            if searchText == "" {
                                Text("All")
                            } else {
                                Text("")
                            }
                        }
                    }
                }
                
                Spacer()
            }
        }
        .searchable(text: $searchText, placement: .navigationBarDrawer, prompt: Text("Search"))
        .onChange(of: searchText) { oldValue, newValue in
            viewModel.updateFilter(filterString: searchText)
        }
        .navigationTitle("Select currency")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            viewModel.loadData()
        }
    }
}

#Preview {
    CurrencyView()
}

//
//  AccountView.swift
//  finance app
//
//  Created by Izbassar on 01.12.2023.
//

import SwiftUI

struct AccountView: View {
    @State private var isAirplaneOn: Bool = false
    @State private var isNotification: Bool = false
    @State private var notificationEdit: Bool = false
    private var viewModel: AccountViewModel = AccountViewModel()
    @AppStorage("firstname") private var firstname: String?
    @AppStorage("lastname") private var lastname: String?
    @AppStorage("notification") private var notification: Bool?
    
    var body: some View {
        NavigationView(content: {
            Form {
                NavigationLink {
                    AccountDetailsView()
                } label: {
                    HStack {
                        Image(systemName: "person.crop.circle").resizable()
                            .frame(width: 50, height: 50).foregroundStyle(.blue)
                        VStack(alignment: .leading, content: {
                            HStack {
                                Text(firstname ?? "").font(.title3)
                                Text(lastname ?? "").font(.title3)
                            }
                        })
                    }
                }
                
                Section {
                    HStack {
                        ZStack {
                            RoundedRectangle(cornerRadius: 4).fill(.orange)
                                .frame(width: 28, height: 28)
                            Image(systemName: "airplane").foregroundStyle(.white)
                        }
                        Toggle("Airplane Mode", isOn: $isAirplaneOn)
                    }
                }
                
                Section {
                    HStack {
                        ZStack {
                            RoundedRectangle(cornerRadius: 4).fill(.red)
                                .frame(width: 28, height: 28)
                            Image(systemName: "bell.badge.fill").foregroundStyle(.white)
                        }
                        Toggle("Notification", isOn: $notificationEdit)
                            .toggleStyle(SwitchToggleStyle())
                            .onChange(of: notificationEdit, initial: false) { oldValue, newValue in
                                notification = notificationEdit
                            }
                    }
                    
                } header: {
                    Text("Actions")
                }
                
                Section {
                    NavigationLink {
                        CurrencyView()
                    } label: {
                        HStack {
                            ZStack {
                                RoundedRectangle(cornerRadius: 4, style: .continuous).fill(.green)
                                    .frame(width: 28, height: 28)
                                Image(systemName: "dollarsign.circle.fill").foregroundStyle(.white)
                            }
                            Text("Currency")
                        }
                    }
                }
                
                ZStack {
                    NavigationLink(destination: GetPremiumView()) {
                        LinearGradient(colors: [Color.yellow, Color.red], startPoint: .topLeading, endPoint: .bottomTrailing)
                            .mask(alignment: .center) {
                                Text("Get Premium")
                                    .font(.system(size: 24))
                            }
                    }
                }
                .frame(alignment: .center)
                .background(Color("CustomBlack"))
            }
            .navigationTitle("Settings")
            .toolbarTitleDisplayMode(.inline)
            .onAppear(perform: {
                viewModel.loadData()
                notificationEdit = notification ?? false
            })
        })
    }
}

#Preview {
    AccountView()
}

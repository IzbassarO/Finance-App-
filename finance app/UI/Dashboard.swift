//
//  Dashboard.swift
//  finance app
//
//  Created by Izbassar on 01.12.2023.
//

import SwiftUI

struct Dashboard: View {
    @AppStorage("money") var money: Int!
    var body: some View {
        TabView {
            Group {
                HomeView()
                    .background((money >= 0) ? Color("CustomGreen") : Color("CustomRed"))
                    .tabItem {
                        Label("Home", systemImage: "house.fill")
                    }
                    .tint(money >= 0 ? Color("CustomRed") : Color("CustomGreen"))
                ReportView()
                    .tabItem {
                        Label("Report", systemImage: "chart.bar.fill")
                    }
                    .tint(Color("CustomGreen"))
                    .toolbarBackground(.hidden, for: .navigationBar)
                NavigationStack{ 
                    AccountView()
                }
                .tabItem {
                    Label("Account", systemImage: "person.crop.circle.fill")
                }
                .tint(Color("CustomGreen"))
            }
            .toolbarBackground(.black, for: .tabBar)
            .toolbarBackground(.visible, for: .tabBar)
            .toolbarColorScheme(.dark, for: .tabBar)
        }
        
    }
}

#Preview {
    Dashboard()
}

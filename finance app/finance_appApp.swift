//
//  finance_appApp.swift
//  finance app
//
//  Created by Izbassar on 01.12.2023.
//

import SwiftUI

@main
struct finance_appApp: App {
    @State private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}

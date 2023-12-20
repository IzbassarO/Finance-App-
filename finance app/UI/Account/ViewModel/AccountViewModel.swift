//
//  AccountViewModel.swift
//  finance app
//
//  Created by Izbassar on 03.12.2023.
//

import Foundation
import SwiftUI

class AccountViewModel: ObservableObject {
    @Published var firstname: String = ""
    @Published var lastname: String = ""
    @Published var notification: Bool = false
    @AppStorage("firstname") var firstnameS: String?
    @AppStorage("lastname") var lastnameS: String?
    @AppStorage("notification") var notificationS: Bool?
    
    func loadData() {
        firstname = firstnameS ?? ""
        lastname = lastnameS ?? ""
        notification = notificationS ?? false
    }
}

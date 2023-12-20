//
//  AccountDetailsView.swift
//  finance app
//
//  Created by Izbassar on 03.12.2023.
//

import SwiftUI

struct AccountDetailsView: View {
    
    @AppStorage("firstname") private var firstname: String?
    @AppStorage("lastname") private var lastname: String?
    
    @State private var firstnameEdit: String = ""
    @State private var lastnameEdit: String = ""
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView(content: {
            Form(content: {
                Section {
                    Section {
                        TextField("First Name", text: $firstnameEdit)
                        TextField("Last Name", text: $lastnameEdit)
                    }
                } header: {
                    Text("Personal Information")
                }
                
                Button("Save") {
                    firstname = firstnameEdit
                    lastname = lastnameEdit
                    dismiss()
                }
                
            })
            .tint(.blue)
            .navigationTitle("Account")
            .onAppear(perform: {
                firstnameEdit = firstname ?? ""
                lastnameEdit = lastname ?? ""
            })
        })
    }
}

#Preview {
    AccountDetailsView()
}

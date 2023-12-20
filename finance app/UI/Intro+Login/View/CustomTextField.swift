//
//  CustomTextField.swift
//  finance app
//
//  Created by Izbassar on 04.12.2023.
//

import SwiftUI

struct CustomTextField: View {
    @Binding var text: String
    var hint: String
    var leadingIcon: Image
    var isPassword: Bool = false
    var body: some View {
        HStack(spacing: -10) {
            leadingIcon
                .font(.callout)
                .foregroundStyle(.gray)
                .frame(width: 40, alignment: .leading)
            
            
            
            TextField(hint, text: $text)
        }
        .padding(.horizontal, 15)
        .padding(.vertical, 15)
        .background {
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .fill(.gray.opacity(0.1))
        }
    }
}

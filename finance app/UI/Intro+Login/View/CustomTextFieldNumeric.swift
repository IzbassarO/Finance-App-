//
//  CustomTextFieldNumeric.swift
//  finance app
//
//  Created by Izbassar on 04.12.2023.
//

import Foundation
import SwiftUI

struct CustomTextFieldNumeric: View {
    @Binding var cash: Int
    
    var hint: String
    var leadingIcon: Image
    var isPassword: Bool = false
    var body: some View {
        HStack(spacing: -10) {
            leadingIcon
                .font(.callout)
                .foregroundStyle(.gray)
                .frame(width: 40, alignment: .leading)
            
            TextField(hint ,value: $cash, formatter: currencyFormatter) {
            }
            .labelsHidden()
            .keyboardType(.numberPad)
            .multilineTextAlignment(.trailing)
        }
        .padding(.horizontal, 15)
        .padding(.vertical, 15)
        .background {
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .fill(.gray.opacity(0.1))
        }
    }
}

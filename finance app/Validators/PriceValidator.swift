//
//  PriceValidator.swift
//  finance app
//
//  Created by Izbassar on 05.12.2023.
//

import Foundation

/// Price string validator
class PriceExpressionValidator: Validator {
    static func validate(str: Double) -> Bool {
        let str = String(Int(str))
        if str.isEmpty {
            return false
        }
        
        var isValid = true
        let allowed = "01234567890+-"
        str.forEach { char in
            if !allowed.contains(char) {
                isValid = false
            }
        }
        return isValid
    }
}

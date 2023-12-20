//
//  NameValidator.swift
//  finance app
//
//  Created by Izbassar on 05.12.2023.
//

import Foundation

/// Name string validator
class NameExpressionValidator: Validator {
    static func validate(str: Double) -> Bool {
        let str = String(str)
        if str.isEmpty {
            return false
        }
        
        var isValid = true
        
        return isValid
    }
}

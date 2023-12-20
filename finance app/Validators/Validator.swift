//
//  Validator.swift
//  finance app
//
//  Created by Izbassar on 05.12.2023.
//

import Foundation

/// Base protocol for validators
protocol Validator {
    static func validate(str: Double) -> Bool
}

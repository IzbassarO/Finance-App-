//
//  MathExpressionError.swift
//  finance app
//
//  Created by Izbassar on 05.12.2023.
//

import Foundation
import SwiftUI

/// Should be
/// LocalizedError Intread Of String
enum MathExpressionError: Error {
    case invalidExpression
    
    var errorDescription: String {
        switch self {
        case .invalidExpression:
            return "Invalid expression"
        }
    }
}

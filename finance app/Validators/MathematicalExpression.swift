//
//  MathematicalExpression.swift
//  finance app
//
//  Created by Izbassar on 06.12.2023.
//

import Foundation

class MathematicalExpression {
    private let line: Double
    
    init(line: Double) {
        self.line = line
    }
    
    func check() throws -> Int {
        if line == 0 {
            throw MathExpressionError.invalidExpression
        }
        if line > 100000000 {
            throw MathExpressionError.invalidExpression
        }
        return Int(line)
    }
}

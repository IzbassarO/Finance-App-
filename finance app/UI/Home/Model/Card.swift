//
//  Card.swift
//  finance app
//
//  Created by Izbassar on 02.12.2023.
//

import Foundation
import SwiftUI

struct Card: Identifiable {
    var id = UUID()
    var bgColor: Color
    var balance: String
    var cardNumber: String
}

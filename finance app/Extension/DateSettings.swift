//
//  DateSettings.swift
//  finance app
//
//  Created by Izbassar on 02.12.2023.
//

import Foundation
import SwiftUI

extension Date {
    static func from(year: Int, month: Int, day: Int) -> Date {
        let calendar = Calendar.current
        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = day
        return calendar.date(from: dateComponents) ?? Date()
    }
}

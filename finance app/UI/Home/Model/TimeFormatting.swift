//
//  TimeFormatting.swift
//  finance app
//
//  Created by Izbassar on 01.12.2023.
//

import Foundation

func calcTimeSince(date: Date) -> String {
    let minutes = Int(-date.timeIntervalSinceNow)/60
    let hours = minutes/60
    let days = hours/24
    
    if minutes < 1 {
      return "right now"
    } else if minutes == 1 {
        return "1 minute ago"
    } else if minutes > 1 && minutes < 60 {
        return "\(minutes) minutes ago"
    } else if minutes >= 60 && hours < 2 {
        return "1 hour ago"
    } else if minutes >= 120 && hours < 24 {
        return "\(hours) hours ago"
    } else if hours == 24 {
        return "1 day ago"
    } else if hours > 24 && days <= 30 {
        return "\(days) days ago"
    } else {
        return "month or later"
    }
}

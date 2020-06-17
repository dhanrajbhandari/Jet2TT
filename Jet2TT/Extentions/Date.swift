//
//  Date.swift
//  Jet2TT
//
//  Created by Dhanraj Bhandari on 16/06/20.
//  Copyright © 2020 Dhanraj Bhandari. All rights reserved.
//

import Foundation

extension Date{
    
    
    static func getElapsedInterval(endDateStr: String) -> String {

        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        let end = dateFormatterGet.date(from: endDateStr) ?? Date()
        
       
        if let interval = Calendar.current.dateComponents([.year], from: end, to: Date()).year {
            if interval > 0 {
                return "\(interval) yr"
            }
        }

        if let interval = Calendar.current.dateComponents([.month], from: end, to: Date()).month {
            if interval > 0 {
                return "\(interval) month"
            }
        }

        if let interval = Calendar.current.dateComponents([.weekOfMonth], from: end, to: Date()).weekOfMonth {
            if interval > 0 {
                return "\(interval) week"
            }
        }

        if let interval = Calendar.current.dateComponents([.day], from: end, to: Date()).day {
            if interval > 0 {
                return "\(interval) day"
            }
        }

        if let interval = Calendar.current.dateComponents([.hour], from: end, to: Date()).hour {
            if interval > 0 {
                return "\(interval) hr"
            }
        }

        if let interval = Calendar.current.dateComponents([.minute], from: end, to: Date()).minute {
            if interval > 0 {
                return "\(interval) min"
            }
        }
        if let interval = Calendar.current.dateComponents([.second], from: end, to: Date()).minute {
            if interval > 0 {
                return "\(interval) sec"
            }
        }

        return "recently"
    }

}

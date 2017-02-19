//
//  Date+Converter.swift
//  Mapper
//
//  Created by Anderthan Hsieh on 2/18/17.
//  Copyright © 2017 anderthan. All rights reserved.
//

import Foundation

let formats : [String] = [
    "yyyy-MM-dd'T'HH:mm:ss.SSSZ",
    "yyyy-MM-dd'T'HH:mm:ss.SSSSSSZ",
    "yyyy-MM-dd",
    "hh:mma"
]

public extension Date {
    
    static func dateFormatterWithFormat(_ format:String) -> DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = format
        return dateFormatter
    }
    
    static func dateFromString(_ str: String) -> Date? {
        for f in formats {
            let df = dateFormatterWithFormat(f)
            if let result = df.date(from: str) {
                return result
            }
        }
        
        return nil
    }

}

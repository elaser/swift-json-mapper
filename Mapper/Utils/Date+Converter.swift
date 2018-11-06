//
//  Date+Converter.swift
//  Mapper
//
//  Created by Anderthan Hsieh on 2/18/17.
//  Copyright © 2017 anderthan. All rights reserved.
//

import Foundation

extension DateFormatter {
    @nonobjc convenience init(with format: String) {
        self.init()
        locale = Locale(identifier: "en_US_POSIX")
        timeZone = .current
        dateFormat = format
    }
}

extension Date {
    
    @nonobjc init?(from dateString: String?) {
        guard let dateString = dateString else { return nil }
        
        let formats = [
            "yyyy-MM-dd'T'HH:mm:ss.SSSSSSZ",
            "yyyy-MM-dd'T'HH:mm:ss.SSSSSS'Z'",
            "yyyy-MM-dd'T'HH:mm:ss.SSSZ",
            "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
            "yyyy-MM-dd'T'HH:mm:ssZ",
            "yyyy-MM-dd'T'HH:mm:ss'Z'",
            "yyyy-MM-dd",
            "hh:mma",
            "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        ]
    
        if let date = formats.compactMap({ DateFormatter(with: $0).date(from: dateString) }).first {
            self = date
        } else {
            return nil
        }
    }
}

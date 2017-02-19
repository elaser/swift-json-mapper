//
//  Date+Converter.swift
//  Mapper
//
//  Created by Anderthan Hsieh on 2/18/17.
//  Copyright © 2017 anderthan. All rights reserved.
//

import Foundation


/**
 + (NSDateFormatter *)ISO_8601_DateFormatter
 {
 static NSDateFormatter *ISO_8601_DateFormatter;
 static dispatch_once_t onceToken;
 dispatch_once(&onceToken, ^{
 ISO_8601_DateFormatter = [[NSDateFormatter alloc] init];
 NSLocale *enUSPOSIXLocale = [NSLocale localeWithLocaleIdentifier:@"en_US_POSIX"];
 [ISO_8601_DateFormatter setLocale:enUSPOSIXLocale];
 ISO_8601_DateFormatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ss.SSSZ";
 
 });
 return ISO_8601_DateFormatter;
 }
 **/
extension Date {
    
    static func safeDateFromISO8601String(str: String) -> Date {
        return self.dateFromISO8601String(str: str, defaultDate: Date())
    }
    
    static func dateFromISO8601String(str: String, defaultDate: Date) -> Date {
        guard let date = self.dateFromISO8601String(str: str) else {
            print("unable to convert \(str) to ISO8601String")
            return Date()
        }
        
        return date
    }
    
    static func dateFromISO8601String(str: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        return dateFormatter.date(from: str)
    }
}

//
//  ConvertiblePrimitive.swift
//  Mapper
//
//  Created by Anderthan Hsieh on 2/19/17.
//  Copyright © 2017 anderthan. All rights reserved.
//

import Foundation

public protocol ConvertiblePrimitive : Convertible {}

public extension ConvertiblePrimitive {
    static func convert(_ from: Any) throws -> ConvertedType {
        if let value = from as? ConvertedType {
            return value
        }
        
        throw MappingError.InvalidFormat
    }
}

extension String : Convertible {
    public static func convert(_ from: Any) throws -> String {
        if let value = from as? String {
            return value
        }
        
        throw MappingError.InvalidFormat
    }
}


extension Int : Convertible {
    public static func convert(_ from: Any) throws -> Int {
        if let value = from as? Int {
            return value
        }
        
        throw MappingError.InvalidFormat
    }
}

extension UInt : Convertible {
    public static func convert(_ from: Any) throws -> UInt {
        if let value = from as? UInt {
            return value
        }
        
        throw MappingError.InvalidFormat
    }
}

extension Float : Convertible {
    public static func convert(_ from: Any) throws -> Float {
        if let value = from as? Float {
            return value
        }
        
        throw MappingError.InvalidFormat
    }
}

extension Double : Convertible {
    public static func convert(_ from: Any) throws -> Double {
        if let value = from as? Double {
            return value
        }
        
        throw MappingError.InvalidFormat
    }
}

extension Bool : Convertible {
    public static func convert(_ from: Any) throws -> Bool {
        if let value = from as? Bool {
            return value
        }
        
        throw MappingError.InvalidFormat
    }
}

extension NSNumber : Convertible {
    public static func convert(_ from: Any) throws -> NSNumber {
        if let value = from as? NSNumber {
            return value
        }
        
        throw MappingError.InvalidFormat
    }
}

extension Date : Convertible {
    public static func convert(_ from: Any) throws -> Date {
        if let value = from as? String {
            guard let date = Date.dateFromString(value) else {
                throw MappingError.InvalidDateFormat
            }
            return date
        }
        
        throw MappingError.InvalidFormat
    }
}

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
        
        throw MappingError.InvalidFormat(String(describing: from), String(describing: ConvertedType.self))
    }
}

extension String : Convertible {
    public static func convert(_ from: Any) throws -> String {
        switch type(of: from) {
        case is Int.Type:
            return String(from as! Int)
        case is String.Type:
            return from as! String
        case is Double.Type:
            return String(from as! Double)
        case is Bool.Type:
            return String(from as! Bool)
        case is NSNumber.Type:
            return String(describing: from as! NSNumber)
        default:
            break
        }
        
        if let value = from as? String {
            return value
        }
        
        throw MappingError.InvalidFormat(String(describing: from), "String")
    }
}


extension Int : Convertible {
    public static func convert(_ from: Any) throws -> Int {
        if let value = from as? Int {
            return value
        }
        if let value = from as? String, let number = Int(value) {
            return number
        }
        
        throw MappingError.InvalidFormat(String(describing: from), "Int")
    }
}

extension UInt : Convertible {
    public static func convert(_ from: Any) throws -> UInt {
        if let value = from as? UInt {
            return value
        }
        if let value = from as? String, let number = UInt(value) {
            return number
        }
        
        throw MappingError.InvalidFormat(String(describing: from), "UInt")
    }
}

extension Float : Convertible {
    public static func convert(_ from: Any) throws -> Float {
        if let value = from as? Float {
            return value
        }
        if let value = from as? String, let number = Float(value) {
            return number
        }
        
        throw MappingError.InvalidFormat(String(describing: from), "Float")
    }
}

extension Double : Convertible {
    public static func convert(_ from: Any) throws -> Double {
        if let value = from as? Double {
            return value
        }
        if let value = from as? String, let number = Double(value) {
            return number
        }

        throw MappingError.InvalidFormat(String(describing: from), "Double")
    }
}

extension Bool : Convertible {
    public static func convert(_ from: Any) throws -> Bool {
        if let value = from as? Bool {
            return value
        }
        if let value = from as? String, let number = Bool(value) {
            return number
        }

        throw MappingError.InvalidFormat(String(describing: from), "Bool")
    }
}

extension NSNumber : Convertible {
    public static func convert(_ from: Any) throws -> NSNumber {
        if let value = from as? NSNumber {
            return value
        }
        
        throw MappingError.InvalidFormat(String(describing: from), "NSNumber")
    }
}

extension Date : Convertible {
    public static func convert(_ dateString: Any) throws -> Date {
        guard let string = dateString as? String else { throw MappingError.InvalidFormat(String(describing: dateString), "String") }
        guard let date = Date(from: string) else { throw MappingError.InvalidDateFormat(string) }
        return date
    }
}

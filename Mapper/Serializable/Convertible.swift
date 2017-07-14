//
//  Convertible.swift
//  Mapper
//
//  Created by Anderthan Hsieh on 2/19/17.
//  Copyright © 2017 anderthan. All rights reserved.
//

import Foundation

/**
 Note (Anderthan): Convertible will allow any type to be able to take in an Any object and convert to its type.  For example, if you have some custom mapping you want to do, all you need to make sure is your type conforms to Convertible protocol.
 **/
public protocol Convertible {
    
    /**
     Attempts to convert the input value into the receiving type. The input value's type is one of the possible types returned by JSONSerialization as nodes or leaves of the resulting structure.
     - parameter from: The raw value to convert
     */
     init(_ from: Any) throws
//    static func convert(_ from: Any) throws -> Self
}

extension String : Convertible {
    public static func convert(_ from: Any) throws -> String {
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
        
        throw MappingError.InvalidFormat(String(describing: from), "Int")
    }
}

extension UInt : Convertible {
    public static func convert(_ from: Any) throws -> UInt {
        if let value = from as? UInt {
            return value
        }
        
        throw MappingError.InvalidFormat(String(describing: from), "UInt")
    }
}

extension Float : Convertible {
    public static func convert(_ from: Any) throws -> Float {
        if let value = from as? Float {
            return value
        }
        
        throw MappingError.InvalidFormat(String(describing: from), "Float")
    }
}

extension Double : Convertible {
    public static func convert(_ from: Any) throws -> Double {
        if let value = from as? Double {
            return value
        }
        
        throw MappingError.InvalidFormat(String(describing: from), "Double")
    }
}

extension Bool : Convertible {
    public static func convert(_ from: Any) throws -> Bool {
        if let value = from as? Bool {
            return value
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

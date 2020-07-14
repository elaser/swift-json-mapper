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
    static func convert(_ from: Any) throws -> Self
}

extension String : Convertible {
    public static func convert(_ value: Any) throws -> String {
        if let value = value as? String {
            return value
        } else if let value = value as? NSNumber {
            return value.stringValue
        } else if let value = value as? Double {
            return String(value)
        } else if let value = value as? Bool {
            return String(value)
        } else if let value = value as? Int {
            return String(value)
        }
        
        throw MappingError.InvalidFormat(String(describing: value), "String")
    }
}


extension Int : Convertible {
    public static func convert(_ from: Any) throws -> Int {
        if let value = from as? Int {
            return value
        } else if let value = from as? String, let number = Int(value) {
            return number
        } else if let value = from as? Bool {
            return value ? 1 : 0
        }
        
        throw MappingError.InvalidFormat(String(describing: from), "Int")
    }
}

extension UInt : Convertible {
    public static func convert(_ from: Any) throws -> UInt {
        if let value = from as? UInt {
            return value
        } else if let value = from as? String, let number = UInt(value) {
            return number
        } else if let value = from as? Bool {
            return value ? 1 : 0
        }
        
        throw MappingError.InvalidFormat(String(describing: from), "UInt")
    }
}

extension Float : Convertible {
    public static func convert(_ from: Any) throws -> Float {
        if let value = from as? Float {
            return value
        } else if let value = from as? String, let number = Float(value) {
            return number
        } else if let value = from as? Bool {
            return value ? 1 : 0
        }
        
        throw MappingError.InvalidFormat(String(describing: from), "Float")
    }
}

extension Double : Convertible {
    public static func convert(_ from: Any) throws -> Double {
        if let value = from as? Double {
            return value
        } else if let value = from as? String, let number = Double(value) {
            return number
        } else if let value = from as? Bool {
            return value ? 1 : 0
        }
        
        throw MappingError.InvalidFormat(String(describing: from), "Double")
    }
}

extension Bool : Convertible {
    public static func convert(_ from: Any) throws -> Bool {
        if let value = from as? Bool {
            return value
        } else if let value = from as? String, let number = Bool(value) {
            return number
        } else if let value = from as? NSNumber {
            return value.boolValue
        }
        
        throw MappingError.InvalidFormat(String(describing: from), "Bool")
    }
}

extension NSNumber : Convertible {
    public static func convert(_ value: Any) throws -> Self {
        return try __convert(value)
    }
    
    private static func __convert<T>(_ value: Any) throws -> T where T: NSNumber {
        if let value = value as? T {
            return value
        } else if let value = value as? String {
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal
            if let number = numberFormatter.number(from: value) as? T {
                return number
            }
        } else if let value = value as? Bool {
            return T(value: value)
        } else if let value = value as? Int {
            return T(value: value)
        } else if let value = value as? Double {
            return T(value: value)
        }
        
        throw MappingError.InvalidFormat(String(describing: value), "NSNumber")
    }
}

extension Date : Convertible {
    public static func convert(_ dateString: Any) throws -> Date {
        guard let string = dateString as? String else { throw MappingError.InvalidFormat(String(describing: dateString), "String") }
        guard let date = Date(from: string) else { throw MappingError.InvalidDateFormat(string) }
        return date
    }
}

extension URL: Convertible {
    public static func convert(_ from: Any) throws -> URL {
        let string = try String.convert(from)
        guard let url = URL(string: string) else { throw MappingError.InvalidFormat(String(describing: string), "URL") }
        return url
    }
}

//
//  JSON.swift
//  Mapper
//
//  Created by Anderthan Hsieh on 10/1/16.
//  Copyright © 2016 anderthan. All rights reserved.
//

import Foundation

public enum JSON {
    case dictionary([String: JSON])
    case array([JSON])
    case string(String)
    case number(NSNumber)
    case bool(Bool)
    case null
}

public extension JSON {
    /** Convert any object into JSON **/
    init(obj: Any) {
        switch obj {
            
        case let a as [Any]:
            self = .array(a.map(JSON.init))
            
        case let a as [String: Any]:
            self = .dictionary(a.map(JSON.init))
            
        case let a as String:
            self = .string(a)
            
        case let a as NSNumber:
            self = .number(a)
        
        default:
            self = .null
        }
    }

    /**
     Note (Anderthan): Determine if two JSON objects have the same type.  For example, if we want to see if a
     JSON.dictionary is of type JSON.dictionary, we can use this method to easily compare.
     **/
    func isSameType(_ json: JSON) -> Bool {
        switch (self, json) {
        case (.string(_), .string(_)): return true
        case (.number(_), .number(_)): return true
        case (.bool(_), .bool(_)): return true
        case (.array(_), .array(_)): return true
        case (.dictionary(_), .dictionary(_)): return true
        case (.null, .null): return true
        default: return false
        
        }
    }
    
    /**
     Note (Anderthan): Provide get function which will determine which type of JSON enum the key is and return appropriate response.  We will default to returning nil if there is no such key.  Perhaps a future improvement is for this function to throw.
     **/
    func get(key: String, raw: Bool = true) -> Any? {
        switch self {
        case let .dictionary(d):
            if raw {
                return d[key]?.rawValue()
            }
            else {
                return d[key]
            }
        default:
            return nil
        }
    }
    
    /**
     Note (Anderthan): Sometimes its not enough just to get key, and we want to have keypath for deeply nested objects
     **/
    func getKeyPath(_ keyPath: String, raw: Bool = true) -> Any? {
        let keys = keyPath.components(separatedBy: ".")
        var val = self
        for key in keys {
            if let result = val.get(key: key, raw: false) as? JSON {
                val = result
            }
            else {
                return nil
            }
        }
        
        if raw {
            return val.rawValue()
        }
        else {
            return val
        }
    }
    
    func getKeys() -> [String] {
        switch self {
        case let .dictionary(d):
            return Array.init(d.keys)
        default:
            return []
        }
    }
    
    /**
     Note (Anderthan): Sometimes, you want rawValue of the underlying component that JSON enum is wrapping.  rawValue will return what is under the hood.
     **/
    func rawValue() -> Any? {
        switch self {
        case let .dictionary(d):
            return d
        case let.string(s):
            return s
        case let .number(n):
            return n
        case let .bool(b):
            return b
        case let .array(a):
            return a
        default:
            return nil
        }
    }
    
    /**
     Note (Anderthan): Checks if a particular instance of JSON is valid for some relational mapping.  Dictionarys and arrays are allowed, but the other ones are not.
    **/
    func isValidForDirectMapping() -> Bool {
        switch self {
        case .dictionary(_), .array(_):
            return false
        default:
            return true
        }
    }
    
    func children() -> [JSON]? {
        switch self {
        case let .array(arr):
            return arr
        default:
            return nil
        }
    }
}

extension JSON: Equatable { }

// Determine if two JSON objects are equal
public func == (lhs: JSON, rhs: JSON) -> Bool {
    switch (lhs, rhs) {
    case let (.string(l), .string(r)): return l == r
    case let (.number(l), .number(r)): return l == r
    case let (.bool(l), .bool(r)): return l == r
    case let (.array(l), .array(r)): return l == r
    case let (.dictionary(l), .dictionary(r)): return l == r
    case (.null, .null): return true
    default: return false
    }
}


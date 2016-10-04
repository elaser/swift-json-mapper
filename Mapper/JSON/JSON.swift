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



//
//  Operator.swift
//  Mapper
//
//  Created by Anderthan Hsieh on 10/2/16.
//  Copyright © 2016 anderthan. All rights reserved.
//

import Foundation

public func =><T>(lhs: JSON, rhs: String) throws -> T {
    
    if T.self == Date.self {
        if let val = lhs.getKeyPath(rhs) as? String {
            guard let date = Date.dateFromString(val) as? T else {
                throw MappingError.InvalidDateFormat
            }
            return date
        }
        else {
            throw MappingError.NilValue
        }
    }
    
    if let val = lhs.getKeyPath(rhs) as? T {
        return val
    }
    else {
        throw MappingError.NilValue
    }
}

public func =>?<T>(lhs: JSON, rhs: String) -> T? {
    if let val = lhs.getKeyPath(rhs) as? T {
        return val
    }
    else {
        return nil
    }
}


infix operator => : ConversionPrecedence
infix operator =>? : ConversionPrecedence
infix operator ~> : ConversionPrecedence

precedencegroup ConversionPrecedence {
    associativity: left
    higherThan: AssignmentPrecedence
}

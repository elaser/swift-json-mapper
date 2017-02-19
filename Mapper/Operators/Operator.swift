//
//  Operator.swift
//  Mapper
//
//  Created by Anderthan Hsieh on 10/2/16.
//  Copyright © 2016 anderthan. All rights reserved.
//

import Foundation

public func =><T>(lhs: JSON, rhs: String) throws -> T where T: Convertible {
    
    if let val = lhs.getKeyPath(rhs) {
        do {
            return try T.convert(val) as! T
        }
        catch {
            throw MappingError.InvalidFormat
        }
    }
    else {
        throw MappingError.NilValue
    }
}

public func =>?<T>(lhs: JSON, rhs: String) -> T? where T: Convertible {
    return try? lhs => rhs
}


infix operator => : ConversionPrecedence
infix operator =>? : ConversionPrecedence

precedencegroup ConversionPrecedence {
    associativity: left
    higherThan: AssignmentPrecedence
}

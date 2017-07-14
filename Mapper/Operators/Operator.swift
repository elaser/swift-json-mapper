//
//  Operator.swift
//  Mapper
//
//  Created by Anderthan Hsieh on 10/2/16.
//  Copyright © 2016 anderthan. All rights reserved.
//

import Foundation

precedencegroup ConversionPrecedence {
    associativity: left
    higherThan: NilCoalescingPrecedence
}

infix operator => : ConversionPrecedence
infix operator =>? : ConversionPrecedence

/**
 */
public func =><T>(lhs: JSON, rhs: String) throws -> T where T: Convertible, T.ConvertedType == T {
    guard let val = lhs.getKeyPath(rhs) else { throw MappingError.NilValue }
    return try T.convert(val)
}

public func =>?<T>(lhs: JSON, rhs: String) -> T? where T: Convertible, T.ConvertedType == T {
    return try? lhs => rhs
}


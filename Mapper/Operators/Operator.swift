//
//  Operator.swift
//  Mapper
//
//  Created by Anderthan Hsieh on 10/2/16.
//  Copyright © 2016 anderthan. All rights reserved.
//

import Foundation

func =><T>(lhs: JSON, rhs: String) throws -> T {
    if let val = lhs.getKeyPath(rhs) as? T {
        return val
    }
    else {
        throw MappingError.NilValue
    }
}


infix operator => : ConversionPrecedence
infix operator ~> : ConversionPrecedence

precedencegroup ConversionPrecedence {
    associativity: left
}

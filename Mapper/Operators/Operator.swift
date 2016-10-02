//
//  Operator.swift
//  Mapper
//
//  Created by Anderthan Hsieh on 10/2/16.
//  Copyright © 2016 anderthan. All rights reserved.
//

import Foundation

func ~>(lhs: String, rhs: String) -> SerializerRule {
    func mappingRule(obj: Serializable, rhs: String) -> Any? {
        return rhs
    }
    
    return mappingRule
}

infix operator ~> : ConversionPrecedence

precedencegroup ConversionPrecedence {
    associativity: left
}

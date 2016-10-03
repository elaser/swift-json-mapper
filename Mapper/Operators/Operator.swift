//
//  Operator.swift
//  Mapper
//
//  Created by Anderthan Hsieh on 10/2/16.
//  Copyright © 2016 anderthan. All rights reserved.
//

import Foundation

func ~>(lhs: String, rhs: String) -> SerializerRule {
    func mappingRule(obj: Serializable, key: String) -> Any? {
        return obj.valueForKey(key: lhs)
    }
    
    return mappingRule
}

infix operator ~> : ConversionPrecedence

precedencegroup ConversionPrecedence {
    associativity: left
}

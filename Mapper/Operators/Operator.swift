//
//  Operator.swift
//  Mapper
//
//  Created by Anderthan Hsieh on 10/2/16.
//  Copyright © 2016 anderthan. All rights reserved.
//

import Foundation

func ~>(lhs: String, rhs: String) -> SerializerRule {
    func mappingRule(obj: JSON, key: String) -> Any? {
        
        switch obj {
        case .dictionary(let dic):
            return valueForKeyPath(dictionary: dic, keyPath: lhs)
        default:
            return nil
        }
    }
    
    return mappingRule
}

infix operator ~> : ConversionPrecedence

precedencegroup ConversionPrecedence {
    associativity: left
}

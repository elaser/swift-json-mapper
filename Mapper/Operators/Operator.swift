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
            if let value = valueForKeyPath(dictionary: dic, keyPath: lhs) as? JSON {
                
                return value.rawValue()
            }
            else {
                return nil
            }
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

//
//  Operator.swift
//  Mapper
//
//  Created by Anderthan Hsieh on 10/2/16.
//  Copyright © 2016 anderthan. All rights reserved.
//

import Foundation

func ~>(lhs: String, rhs: String) -> SerializerRule {
    func mappingRule(obj: JSON, recipient: NSObject) {
        switch obj {
        case .dictionary(let dic):
            let returnValue = valueForKeyPath(dictionary: dic, keyPath: lhs)
            recipient.setValue(returnValue, forKey: rhs)
        default:
            print("mappingRule did not work out")
        }
    }
    
    return mappingRule
}

infix operator ~> : ConversionPrecedence

precedencegroup ConversionPrecedence {
    associativity: left
}

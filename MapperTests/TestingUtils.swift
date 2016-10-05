//
//  TestingUtils.swift
//  Mapper
//
//  Created by Anderthan Hsieh on 10/4/16.
//  Copyright © 2016 anderthan. All rights reserved.
//

import Foundation

func ?== <T: Comparable>(firstOptional: T?, secondOptional: T?) -> Bool {
    if let firstForced = firstOptional, let secondForced = secondOptional {
        return firstForced == secondForced
    }
    else {
        return firstOptional == nil && secondOptional == nil
    }
}

infix operator ?== : ConversionPrecedence

precedencegroup ConversionPrecedence {
    associativity: left
}

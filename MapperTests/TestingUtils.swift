//
//  TestingUtils.swift
//  Mapper
//
//  Created by Anderthan Hsieh on 10/4/16.
//  Copyright © 2016 anderthan. All rights reserved.
//

import Foundation

func compareAny <T: Equatable>(firstOptional: Any?, secondOptional: Any?, class: T) -> Bool {
    if let firstForced = firstOptional, let secondForced = secondOptional {
        return firstForced as! T == secondForced as! T
    }
    else {
        return firstOptional == nil && secondOptional == nil
    }
}

func compareAnyNumber(firstOptional: Any?, secondOptional: Any?) -> Bool {
    if let firstForced = firstOptional, let secondForced = secondOptional {
        return (firstForced as! NSNumber).isEqual(to: (secondForced as! NSNumber))
    }
    else {
        return firstOptional == nil && secondOptional == nil
    }
}

//
//  OneToOne.swift
//  Mapper
//
//  Created by Anderthan Hsieh on 10/5/16.
//  Copyright © 2016 anderthan. All rights reserved.
//

import Foundation

infix operator |~> : ConversionPrecedence
infix operator |~>? : ConversionPrecedence

/**
 Note: (Anderthan) - o2o stands for OneToOne relationship.  Given a JSON object, and a NSObject as a recipient, we want to map a nested JSON to it.  You can pass a set of rules (for example if we need to map nested objects, or map different keypaths to another keypath)
 **/
public func |~><T: Serializable>(lhs: JSON, rhs: String) throws -> T {
    guard let fromJSON = lhs.getKeyPath(rhs, raw: false) as? JSON else {
        print("Unable to get \(rhs) from \(String(describing: lhs))")
        throw MappingError.NilValue
    }
    
    return try T(json: fromJSON)
}

public func |~>?<T: Serializable>(lhs: JSON, rhs: String) -> T? {
    return try? lhs |~> rhs
}

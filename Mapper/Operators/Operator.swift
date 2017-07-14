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

// MARK: - Convertible types

/**
 Attempts to transform the JSON leaf/node to a convertible receiving type
 */
public func => <T>(lhs: JSON, rhs: String) throws -> T where T: Convertible {
    guard let val = lhs.getKeyPath(rhs) else { throw MappingError.NilValue }
    return try T.convert(val)
}

public func => <T>(lhs: JSON, rhs: String) -> T? where T: Convertible {
    return try? lhs => rhs
}

// MARK: - Serializable types

/**
 Note: (Anderthan) - o2o stands for OneToOne relationship.  Given a JSON object, and a NSObject as a recipient, we want to map a nested JSON to it.  You can pass a set of rules (for example if we need to map nested objects, or map different keypaths to another keypath)
 **/
public func => <T: Serializable>(lhs: JSON, rhs: String) throws -> T {
    guard let fromJSON = lhs.getKeyPath(rhs, raw: false) as? JSON else {
        print("Unable to get \(rhs) from \(String(describing: lhs))")
        throw MappingError.NilValue
    }
    
    return try T(json: fromJSON)
}

public func => <T: Serializable>(lhs: JSON, rhs: String) -> T? {
    return try? lhs => rhs
}

// MARK: - Collections

/**
 Note: (Anderthan) - o2m stands for OneToMany relationship.  Given a JSON object, and a NSObject as a recipient, we want to map a nested JSON to it.  You can pass a set of rules (for example if we need to map nested objects, or map different keypaths to another keypath), and we will map to an array of mapped objects.
 **/
public func => <T: Serializable>(lhs: JSON, rhs: String) throws -> [T] {
    guard let fromJSON = lhs.getKeyPath(rhs, raw: false) as? JSON,
        let children = fromJSON.children() else {
            print("Unable to get \(rhs) from \(String(describing: lhs))")
            throw MappingError.NilValue
    }
    return try children.reduce([], { $0 + [try T(json: $1)] })
}

public func => <T: Serializable>(lhs: JSON, rhs: String) -> [T]? {
    return try? lhs => rhs
}

public func => <T>(lhs: JSON, rhs: String) throws -> [T] where T: Convertible {
    guard let fromJSON = lhs.getKeyPath(rhs, raw: false) as? JSON,
        let children = fromJSON.children() else {
            print("Unable to get \(rhs) from \(String(describing: lhs))")
            throw MappingError.NilValue
    }
    
    return try children.reduce([], ({ $0 + (try $1.rawValue().flatMap { [try T.convert($0)] } ?? [])}))
}

public func => <T>(lhs: JSON, rhs: String) -> [T]? where T: Convertible {
    return (lhs.getKeyPath(rhs, raw: false) as? JSON)?.children()?.reduce([], ({ $0 + ($1.rawValue().flatMap { try? T.convert($0) }.flatMap{[$0]} ?? [])}))
}

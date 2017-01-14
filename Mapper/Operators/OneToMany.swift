//
//  OneToMany.swift
//  Mapper
//
//  Created by Anderthan Hsieh on 10/7/16.
//  Copyright © 2016 anderthan. All rights reserved.
//

import Foundation


infix operator <~> : ConversionPrecedence
infix operator <~>? : ConversionPrecedence

/**
 Note: (Anderthan) - o2m stands for OneToMany relationship.  Given a JSON object, and a NSObject as a recipient, we want to map a nested JSON to it.  You can pass a set of rules (for example if we need to map nested objects, or map different keypaths to another keypath), and we will map to an array of mapped objects.
 **/
func <~><T: Serializable>(lhs: JSON, rhs: String) throws -> [T] {
    let mapping : SerializerRule<[T]> = o2m(rules: nil)
    if let result = mapping(lhs, rhs) {
        return result
    }
    else {
        throw MappingError.NilValue
    }
}

func <~>?<T: Serializable>(lhs: JSON, rhs: String) throws -> [T]? {
    let mapping : SerializerRule<[T]> = o2m(rules: nil)
    return mapping(lhs, rhs)
}



func o2m<T: Serializable>(rules: [SerializerRule<T>]?) -> SerializerRule<[T]> {
    func mappingRule(obj: JSON, keyPath: String) -> [T]? {
        if let fromJSON = obj.getKeyPath(keyPath, raw: false) as? JSON {
            var objects : [T] = [T]()
            
            if let array = fromJSON.children() {
                for json in array {
                    do {
                        let obj = try T.init(json: json)
                        objects.append(obj)
                    }
                    catch {
                        
                    }
                }
            }
            
            return objects
            
        }
        else {
            print("Unable to get \(keyPath) from \(obj)")
            return []
        }
    }
    
    return mappingRule
}



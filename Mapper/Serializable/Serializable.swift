//
//  Serializable.swift
//  Mapper
//
//  Created by Anderthan Hsieh on 10/1/16.
//  Copyright © 2016 anderthan. All rights reserved.
//

import Foundation

typealias SerializerRule = (_ obj: Serializable, _ key: String) -> Any?

public protocol Serializable {
    /**
     Two functions in Convertable protocol
     1. Serialize - which will take given instance, and convert it to JSON struct
     2. Deserialize - given a JSON struct, it will attempt to convert to the class that is conforming to this protocol
    **/
    
    func serialize() -> JSON
    
    static func deserialize(json: JSON) -> Self
    
    static func mappingRules() -> [(_ key: String, _ mapping: String) -> String]
}

extension Serializable {
    func serialize() -> JSON {
        return JSON.null
    }
    
    static func mappingRules() -> [SerializerRule] {
        
        return []
    }
}

// A rule would be.. given a key and an object, return a value for that key

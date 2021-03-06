//
//  Serializable.swift
//  Mapper
//
//  Created by Anderthan Hsieh on 10/1/16.
//  Copyright © 2016 anderthan. All rights reserved.
//

import Foundation

public protocol Serializable {
    /**
     Two functions in Convertable protocol
     1. Serialize - which will take given instance, and convert it to JSON struct
     2. Deserialize - given a JSON struct, it will attempt to convert to the class that is conforming to this protocol
    **/
    init(json: JSON) throws
}

public extension Serializable {
    /**
     Note (Anderthan): This feature needs to be more well thought out and built.  For now, focused on deserialization
     of objects as most of our operations are GET and PATCH (very little need for serialization of whole objects)
    **/
    func serialize() -> JSON {
        return JSON.null
    }
    
    /**
     Note (Anderthan): This is the set of all mapping rules.  Perhaps I should name it deserializationMappingRules to avoid confusion when we support both serialization and deserialization.
     
     The whole point of having a set of rules is that sometimes we want some sort of custom behavior on our JSON object before converting it to the class.  Some of the most common rules are mapping different keypaths.  Other things might be converting to a specific enum, or running some sort of function on it.
     
     Each rule is meant to be flexible.  A rule will take an object, and a key, and spit out the value that we wil use to store in our object.
    **/
    static func mappingRules() -> [String: SerializerRule<Any>] {
        return [:]
    }
}

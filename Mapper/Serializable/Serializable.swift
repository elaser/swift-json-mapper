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
}

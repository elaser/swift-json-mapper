//
//  Serializable.swift
//  Mapper
//
//  Created by Anderthan Hsieh on 10/1/16.
//  Copyright © 2016 anderthan. All rights reserved.
//

import Foundation

public protocol Convertable {
    /**
     Two functions in Convertable protocol
     1. Serialize - which will take given instance, and convert it to JSON struct
     2. Deserialize - given a JSON struct, it will attempt to convert to the class that is conforming to this protocol
    **/
    
    func serialize() -> JSON
    
    static func deserialize(json: JSON) -> Self
}

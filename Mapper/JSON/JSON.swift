//
//  JSON.swift
//  Mapper
//
//  Created by Anderthan Hsieh on 10/1/16.
//  Copyright © 2016 anderthan. All rights reserved.
//

import Foundation

enum JSON {
    case dictionary([String: JSON])
    case array([JSON])
    case string(String)
    case number(NSNumber)
    case bool(Bool)
    case null
}

extension JSON {
    /** Convert any object into JSON **/
    init(obj: AnyObject) {
        switch obj {
            
        case let a as [AnyObject]:
            self = .array(a.map(JSON.init))
            
        case let a as [String: AnyObject]:
            self = .dictionary(a.map(JSON.init))
            
        case let a as String:
            self = .string(a)
            
        case let a as NSNumber:
            self = .number(a)
        
            
        default:
            self = .null
        }
    }
}

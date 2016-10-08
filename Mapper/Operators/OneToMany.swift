//
//  OneToMany.swift
//  Mapper
//
//  Created by Anderthan Hsieh on 10/7/16.
//  Copyright © 2016 anderthan. All rights reserved.
//

import Foundation

/**
 Note: (Anderthan) - o2m stands for OneToMany relationship.  Given a JSON object, and a NSObject as a recipient, we want to map a nested JSON to it.  You can pass a set of rules (for example if we need to map nested objects, or map different keypaths to another keypath), and we will map to an array of mapped objects.
 **/
func o2m<T: NSObject>(lhs: String, rhs: String, cls: T.Type) -> SerializerRule {
    return o2o(lhs: lhs, rhs: rhs, cls: cls, rules: nil)
}

func o2m<T: NSObject>(lhs: String, rhs: String, cls: T.Type, rules: [SerializerRule]?) -> SerializerRule {
    func mappingRule(obj: JSON, recipient: NSObject) {
        if let fromJSON = obj.getKeyPath(lhs, raw: false) as? JSON {
            
            var objects : [T] = [T]()
            
            if let array = fromJSON.children() {
                for json in array {
                    if let obj = mapObjectFromRules(json: json, cls: cls, rules: rules) {
                        objects.append(obj)
                    }
                }
            }
            
            recipient.setValue(objects, forKey: rhs)
            
        }
        else {
            print("Unable to get \(lhs) from \(obj)")
        }
    }
    
    return mappingRule
}



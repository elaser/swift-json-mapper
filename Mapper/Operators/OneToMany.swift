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
func o2m<T: Serializable>(lhs: String, rhs: String) -> SerializerRule<[T]> {
    func mappingRule(obj: JSON) -> [T] {
        if let fromJSON = obj.getKeyPath(lhs, raw: false) as? JSON {
            
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
            print("Unable to get \(lhs) from \(obj)")
            return []
        }
    }
    
    return mappingRule
}



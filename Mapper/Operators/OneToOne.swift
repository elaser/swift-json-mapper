//
//  OneToOne.swift
//  Mapper
//
//  Created by Anderthan Hsieh on 10/5/16.
//  Copyright © 2016 anderthan. All rights reserved.
//

import Foundation

/**
 Note: (Anderthan) - o2o stands for OneToOne relationship.  Given a JSON object, and a NSObject as a recipient, we want to map a nested JSON to it.  You can pass a set of rules (for example if we need to map nested objects, or map different keypaths to another keypath)
 **/
func o2o<T: Serializable>(lhs: String, rhs: String) -> SerializerRule<T> {
    return o2o(lhs: lhs, rhs: rhs, rules: nil)
}

func o2o<T: Serializable>(lhs: String, rhs: String, rules: [SerializerRule<T>]?) -> SerializerRule<T> {
    func mappingRule(obj: JSON) -> T? {
        if let fromJSON = obj.getKeyPath(lhs, raw: false) as? JSON {
            do {
                let generatedClass = try T.init(json: fromJSON)
                return generatedClass
            }
            catch {
                return nil
            }
        }
        else {
            print("Unable to get \(lhs) from \(obj)")
        }

        return nil
    }
    
    return mappingRule
}

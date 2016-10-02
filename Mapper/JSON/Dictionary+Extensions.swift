//
//  Dictionary+Extensions.swift
//  Mapper
//
//  Created by Anderthan Hsieh on 10/1/16.
//  Copyright © 2016 anderthan. All rights reserved.
//

import Foundation

extension Dictionary {
    /**
     Note: (Anderthan)
     This mapping function is different from stock mapping function.
     Use case here is given JSON init function, you want to iterate through all values of a dictionary and
     apply the same mapping function to it.  You want to return a dictionary with all of the values mapped
     properly
    **/
    func map<T>(_ f: (Value) -> T) -> [Key: T] {
        
        var dict = Dictionary<Key, T>()
        
        for (key, value) in self {
            dict[key] = f(value)
        }
        
        return dict
    }
}

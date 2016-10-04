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

/**
 Note (Anderthan): Dictionaries in Swift don't support getting a value given a key path.  In this case, given a keypath, we will call valueForKeyPath.
 **/
func valueForKeyPath(dictionary: [String: JSON], keyPath: String) -> Any? {
    let keys = keyPath.components(separatedBy: ".")
    return valueForKeyPath(dictionary: dictionary, keys: keys)
}

/**
 Note (Anderthan): Given an array of keys, we'll loop through each array and find value for the given keypath.
 **/
func valueForKeyPath(dictionary: [String: JSON], keys: [String]) -> Any? {
    var mutableKeys = keys

    switch keys.count {
    case 0:
        return nil
    case 1:
        let key = keys[0]
        return dictionary[key]
    case 2..<Int.max:
        let currentDictionary = dictionary
        let key = mutableKeys.removeFirst()
        
        
        guard let dict = currentDictionary[key] else { return nil }
        
        switch dict {
        case .dictionary(let dic):
            return valueForKeyPath(dictionary: dic, keys: keys)
        default:
            return nil
        }
    default:
        return nil
    }
}

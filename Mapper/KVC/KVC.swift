//
//  KVC.swift
//  Mapper
//
//  Created by Anderthan Hsieh on 10/2/16.
//  Copyright © 2016 anderthan. All rights reserved.
//

import Foundation

public protocol KVC {
    func valueForKey(key: String) -> Any?
}

public extension KVC {
    /**
     Note (Anderthan): Since Swift doesn't support KVC, we'll have to do some runtime magic.  Swift 3 deprecated
     reflect API, and we will now need to use Mirror to access properties in run-time.  This function will definitely
     will have a high chance of being deprecated.
    **/
    public func valueForKey(key: String) -> Any? {
        let mirror = Mirror.init(reflecting: self)
        for child : (label: String?, value: Any) in mirror.children {
            if let label = child.label {
                if key == label {
                    return child.value
                }
            }
        }
        
        return nil
    }
    
    /**
        Note (Anderthan): Very similar to valueForKey, but we may want to support keypaths.  For example you may want to flatten out a nested user's attributes. "user.first_name -> first_name"
     **/
    public func valueForKeyPath(keyPath: String) -> Any? {
        var mirror = Mirror.init(reflecting: self)
        
        let keys = keyPath.characters.split(separator: ".").map(String.init)
        for key in keys {
            for child : (label: String?, value: Any) in mirror.children {
                if let label = child.label {
                    if key == label {
                        if key == keys.last {
                            return child.value
                        }
                        else {
                            // This means we found an intermediary key, continue on with the outer for loop
                            mirror = Mirror.init(reflecting: child.value)
                            break
                        }
                    }
                }
            }
        }
        
        return nil
    }
}

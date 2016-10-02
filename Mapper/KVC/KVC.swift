//
//  KVC.swift
//  Mapper
//
//  Created by Anderthan Hsieh on 10/2/16.
//  Copyright © 2016 anderthan. All rights reserved.
//

import Foundation

protocol KVC {
    func valueForKey(key: String) -> Any?
}

extension KVC {
    /**
     Note (Anderthan): Since Swift doesn't support KVC, we'll have to do some runtime magic.  Swift 3 deprecated
     reflect API, and we will now need to use Mirror to access properties in run-time.  This function will definitely
     will have a high chance of being deprecated.
    **/
    func valueForKey(key: String) -> Any? {
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
}

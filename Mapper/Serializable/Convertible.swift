//
//  Convertible.swift
//  Mapper
//
//  Created by Anderthan Hsieh on 2/19/17.
//  Copyright © 2017 anderthan. All rights reserved.
//

import Foundation

/**
 Note (Anderthan): Convertible will allow any type to be able to take in an Any object and convert to its type.  For example, if you have some custom mapping you want to do, all you need to make sure is your type conforms to Convertible protocol.
 **/

public protocol Convertible {
    associatedtype ConvertedType = Self
    
    static func convert(_ from: Any) throws -> ConvertedType
}

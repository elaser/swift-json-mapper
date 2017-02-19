//
//  ConvertiblePrimitive.swift
//  Mapper
//
//  Created by Anderthan Hsieh on 2/19/17.
//  Copyright © 2017 anderthan. All rights reserved.
//

import Foundation

public protocol ConvertiblePrimitive : Convertible {}

public extension ConvertiblePrimitive {
    static func convert(_ from: Any) throws -> ConvertedType {
        if let value = from as? ConvertedType {
            return value
        }
        
        throw MappingError.InvalidFormat
    }
}

extension String : ConvertiblePrimitive {}
extension Int : ConvertiblePrimitive {}
extension UInt : ConvertiblePrimitive {}
extension Float : ConvertiblePrimitive {}
extension Double : ConvertiblePrimitive {}
extension Bool : ConvertiblePrimitive {}

extension Dictionary : ConvertiblePrimitive {}
extension Array : ConvertiblePrimitive {}

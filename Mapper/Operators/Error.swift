//
//  Error.swift
//  Mapper
//
//  Created by Anderthan Hsieh on 1/12/17.
//  Copyright © 2017 anderthan. All rights reserved.
//

import Foundation

public enum MappingError : Error {
    case NilValue
    case InvalidDateFormat(String)
    case InvalidFormat(String, String)
    
    public var localizedDescription: String {
        switch self {
        case .InvalidDateFormat(let value):
            return "The date string specified: (\(value)) cannot be converted to the date object, because it was either nil, or its format does not conform to the dateformatter's format field specification. Please check the string-encoded date value."
        case .NilValue:
            return "A nil value was specified as an input argument for this operation."
        case .InvalidFormat(let value, let expected):
            return "The input value in the JSON field (\(value)) cannot be converted to the expected type (\(expected))."
        }
    }
}

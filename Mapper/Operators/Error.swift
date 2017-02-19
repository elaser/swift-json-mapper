//
//  Error.swift
//  Mapper
//
//  Created by Anderthan Hsieh on 1/12/17.
//  Copyright © 2017 anderthan. All rights reserved.
//

import Foundation

enum MappingError : Error {
    case InvalidRule
    case NilValue
    case InvalidDateFormat
    case InvalidFormat
}

//
//  User.swift
//  Mapper
//
//  Created by Anderthan Hsieh on 1/11/17.
//  Copyright © 2017 anderthan. All rights reserved.
//

import Foundation

struct User {
    let firstName: String
    let lastName: String
    let age: Int
}

extension User : Serializable {
    init(json: JSON) throws {
        try firstName = (json => "first_name")
        try lastName = (json => "last_name")
        try age = (json => "age")
    }
    
}

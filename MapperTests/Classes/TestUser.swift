//
//  TestUser.swift
//  Mapper
//
//  Created by Anderthan Hsieh on 10/5/16.
//  Copyright © 2016 anderthan. All rights reserved.
//

import Foundation

class TestUser : Serializable {
    
    var id: NSNumber
    var vehicleName : String?
    var vehicle : TestVehicle?
    var deliveries: [TestDelivery]?
        
    required init(json: JSON) throws {
        try id = (json => "identifier")
        try vehicleName = (json => "vehicle_name")
        try vehicle = (json |~>? "vehicle")
    }
    
}

class TestDelivery : Serializable {
    var id: NSNumber!
    var name: String!
    
    required init(json: JSON) throws {
        try id = (json => "identifier")
        try name = (json => "name")
    }
}

class TestVehicle : Serializable {
    var name: String?
    
    required init(json: JSON) throws {
        try name = (json => "name")
    }
}

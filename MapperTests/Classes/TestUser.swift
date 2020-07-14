//
//  TestUser.swift
//  Mapper
//
//  Created by Anderthan Hsieh on 10/5/16.
//  Copyright © 2016 anderthan. All rights reserved.
//

import Foundation
@testable import Mapper

class TestUser : Serializable {
    
    var id: NSNumber
    var vehicleName : String?
    var vehicle : TestVehicle?
    var deliveries: [TestDelivery]?
    var createdAt : Date
        
    required init(json: JSON) throws {
        id = try json => "identifier"
        vehicleName = json => "vehicle_name"
        vehicle = json => "vehicle"
        deliveries = json => "deliveries"
        createdAt = try json => "created_at"
    }
    
}

class TestDelivery : Serializable {
    var id: Int
    var name: String
    
    required init(json: JSON) throws {
        try id = (json => "identifier")
        try name = (json => "name")
    }
}

class TestVehicle : Serializable {
    var name: String?
    
    required init(json: JSON) throws {
        name = json => "name"
    }
}

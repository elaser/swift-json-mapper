//
//  OneToOneTests.swift
//  Mapper
//
//  Created by Anderthan Hsieh on 10/6/16.
//  Copyright © 2016 anderthan. All rights reserved.
//

import XCTest

class OneToOneTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testMappingOperator() {
        let vehicleRules = [
            "vehicle.name" ~> "name",
        ]

        let operators = [
            "identifier" ~> "id",
            o2o(lhs: "vehicle", rhs: "vehicle", cls: TestVehicle.self, rules: vehicleRules)
        ]
        
        let userDictionary: [String: Any] = [
            "identifier": 200,
            "vehicle": [
                "name": "Car"
            ]
        ]
        
        let user = TestUser()
        
        let json = JSON(obj: userDictionary)
        
        for op in operators {
            op(json, user)
        }
        
        
        XCTAssertTrue(compareAny(firstOptional: user.id, secondOptional: 200, class: NSNumber.init()) , "user identifier is not correct")
        print("user is: \(user)")
        print("user.vehicle is: \(user.vehicle)")
        print("user.vehicle.name is: \(user.vehicle!.name)")
        
        XCTAssertTrue(compareAny(firstOptional: user.vehicle?.name, secondOptional: "Car", class: String.init()), "Vehicle name did not get ported over correctly")
    }
    
}

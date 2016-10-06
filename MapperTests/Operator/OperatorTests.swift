//
//  OperatorTests.swift
//  Mapper
//
//  Created by Anderthan Hsieh on 10/5/16.
//  Copyright © 2016 anderthan. All rights reserved.
//

import XCTest

class OperatorTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testMappingOperator() {
        let mappingOperator = "identifier" ~> "id"
        let vehicleMappingOperator = "vehicle.name" ~> "vehicleName"
        
        let userDictionary: [String: Any] = [
            "identifier": 200,
            "vehicle": [
                "name": "Car"
            ]
        ]
        
        let user = TestUser()
        
        let json = JSON(obj: userDictionary)
        mappingOperator(json, user)
        XCTAssertTrue(compareAny(firstOptional: user.id, secondOptional: 200, class: NSNumber.init()) , "Grabbing identifier from userDictionary does not work")
        
        vehicleMappingOperator(json, user)
        XCTAssertTrue(compareAny(firstOptional: user.vehicleName, secondOptional: "Car", class: String.init()), "")
    }
}

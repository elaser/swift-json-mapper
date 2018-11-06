//
//  DictionaryExtensionsTests.swift
//  Mapper
//
//  Created by Anderthan Hsieh on 10/5/16.
//  Copyright © 2016 anderthan. All rights reserved.
//

import XCTest
@testable import Mapper

class DictionaryExtensionsTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testValueForKeyPath() {
        let dict: [String: Any] = [
            "id": 140,
            "first_name": "Anderthan",
            "last_name": "Hsieh",
            "vehicle": [
                "id": 2493,
                "name": "Car",
            ]
        ]
        let dictJSON = JSON(obj: dict)
        
        // Test if we can grab the id and it is successful
        let valueOfID = valueForKeyPath(json: dictJSON, keyPath: "id")
        XCTAssertTrue(compareAny(firstOptional: valueOfID, secondOptional: dict["id"], class: NSNumber.init()))
        
        // Test if we can grab a nested element
        let valueOfVehicleName = valueForKeyPath(json: dictJSON, keyPath: "vehicle.name")
        let vehicleName = (dict["vehicle"] as! [String: Any?])["name"]!
        XCTAssertTrue(compareAny(firstOptional: valueOfVehicleName, secondOptional: vehicleName, class: String.init()))
    }
    
}

//
//  JSONTests.swift
//  Mapper
//
//  Created by Anderthan Hsieh on 10/3/16.
//  Copyright © 2016 anderthan. All rights reserved.
//

import XCTest
@testable import Mapper

class JSONTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testJSONConversion() {
        let userDictionary : [String: Any] = [
            "id": 204,
            "first_name": "Anderthan",
            "last_name": "Hsieh",
            "email": "anderthan@doordash.com",
            "zipcode": "94114",
            "deliveries": [
                [
                    "id": 1,
                    "is_complete": false
                ],
                [
                    "id": 2,
                    "is_complete": true
                ]
            ]
        ]
        
        
        let userJSON = JSON(obj: userDictionary)
        
        XCTAssert(userJSON.isSameType(JSON.dictionary([:])), "userJSON should be of type JSON dictionary")

        XCTAssert(compareAnyNumber(firstOptional: userJSON.get(key: "id"), secondOptional: userDictionary["id"]), "id field for userJSON and userDictionary are not equal")
        
        XCTAssertTrue(compareAny(firstOptional: userJSON.get(key: "first_name"), secondOptional: userDictionary["first_name"], class: "first_name field for userJSON and userDictionary are not equal"))
        
        XCTAssertTrue(compareAny(firstOptional: userJSON.get(key: "last_name"), secondOptional: userDictionary["last_name"], class: "last_name field for userJSON and userDictionary are not equal"))
        
        XCTAssertTrue(compareAny(firstOptional: userJSON.get(key: "email"), secondOptional: userDictionary["email"], class: "email field for userJSON and userDictionary are not equal"))
        
        XCTAssertTrue(compareAny(firstOptional: userJSON.get(key: "zipcode"), secondOptional: userDictionary["zipcode"], class: "zipcode field for userJSON and userDictionary are not equal"))
        
        // Compare arrays
        let userDictionaryDeliveries = userDictionary["deliveries"] as! [[String: Any]]
        let JSONDeliveries = userJSON.get(key: "deliveries") as! [JSON]
        
        let rawDelivery1 = userDictionaryDeliveries[0]
        let rawDelivery2 = userDictionaryDeliveries[1]
        
        let JSONDelivery1 = JSONDeliveries[0]
        let JSONDelivery2 = JSONDeliveries[1]
        
        XCTAssertTrue(compareAnyNumber(firstOptional: rawDelivery1["id"], secondOptional: JSONDelivery1.get(key: "id")), "id of nested dictionary in deliveries array is not matching for deliveries[0]")
        XCTAssertTrue(compareAny(firstOptional: rawDelivery1["is_complete"], secondOptional: JSONDelivery1.get(key: "is_complete"), class: Bool.init()), "is_complete of nested dictionary in deliveries array is not matching for deliveries[0]")
        
        XCTAssertTrue(compareAny(firstOptional: rawDelivery2["id"], secondOptional: JSONDelivery2.get(key: "id"), class: NSNumber.init()), "id of nested dictionary in deliveries array is not matching for deliveries[1]")
        XCTAssertTrue(compareAny(firstOptional: rawDelivery1["is_complete"], secondOptional: JSONDelivery1.get(key: "is_complete"), class: Bool.init()), "is_complete of nested dictionary in deliveries array is not matching for deliveries[1]")
    }
    
}

//
//  JSONTests.swift
//  Mapper
//
//  Created by Anderthan Hsieh on 10/3/16.
//  Copyright © 2016 anderthan. All rights reserved.
//

import XCTest

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

        XCTAssert(userJSON.get(key: "id") as! NSNumber == userDictionary["id"] as! NSNumber, "id field for userJSON and userDictionary are not equal")
    }
    
}

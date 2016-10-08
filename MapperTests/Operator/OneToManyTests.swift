//
//  OneToManyTests.swift
//  Mapper
//
//  Created by Anderthan Hsieh on 10/7/16.
//  Copyright © 2016 anderthan. All rights reserved.
//

import XCTest

class OneToManyTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testOneToMany() {
        
        let operators = [
            "identifier" ~> "id",
            o2m(lhs: "deliveries", rhs: "deliveries", cls: TestDelivery.self)
        ]
        
        let userDictionary: [String: Any] = [
            "identifier": 200,
            "deliveries": [
                [
                    "id": 1,
                    "name": "Delivery1"
                ],
                [
                    "id": 2,
                    "name": "Delivery2"
                ],
                [
                    "id": 3,
                    "name": "Delivery3"
                ]
            ]
        ]
        
        let user = TestUser()
        
        let json = JSON(obj: userDictionary)
        
        for op in operators {
            op(json, user)
        }
        
        XCTAssertTrue(compareAny(firstOptional: user.id, secondOptional: 200, class: NSNumber.init()) , "user identifier is not correct")
        
        let delivs = userDictionary["deliveries"] as! [[String: Any]]
        let firstDeliv = delivs.first!
        
        let userDeliveries = user.deliveries
        let firstUserDeliv = userDeliveries!.first!
        
        XCTAssertEqual(delivs.count, userDeliveries?.count)
        
        XCTAssertTrue(compareAny(firstOptional: firstDeliv["id"], secondOptional: firstUserDeliv.id, class: NSNumber.init()), "first user delivery id is not the same")
        XCTAssertTrue(compareAny(firstOptional: firstDeliv["name"], secondOptional: firstUserDeliv.name, class: String.init()), "first user delivery name is not the same")
    }
    
}

//
//  BrastlewarkGameTests.swift
//  BrastlewarkGame
//
//  Created by Luciano Perez Tiranti on 27/02/2018.
//  Copyright © 2018 Luciano Perez Tiranti. All rights reserved.
//

import XCTest

@testable import BrastlewarkGame
@testable import SwiftyJSON

class InhabitantManagerTests: XCTestCase {
    private let inhabitantManager  = InhabitantManager()
    private var inhabitanJSON : JSON = InhabitantHelper.getAnInhabitanJson()
    
    func testGetAnInhabitanJson() {
        let inhabitant: Inhabitant = inhabitantManager.parseInhabitant(json: inhabitanJSON)
        XCTAssertEqual(inhabitant.name, "Tobus Quickwhistle")
        XCTAssertEqual(inhabitant.age, 306)
        XCTAssertEqual(inhabitant.hairColor, "Pink")
        XCTAssertEqual(inhabitant.weight, 39.065952)
        XCTAssertEqual(inhabitant.height, 107.75835)
        XCTAssertEqual(inhabitant.professions.count,6)
        XCTAssertEqual(inhabitant.friends.count, 2)
    }
    
    func testGetInhabits() {
        let ex = expectation(description: "Expecting a JSON data not nil")
       inhabitantManager.getInhabits() { responseObject, error in
            XCTAssertNil(error)
            XCTAssertNotNil(responseObject)
            ex.fulfill()
            
        }
        waitForExpectations(timeout: 10) { (error) in
            if let error = error {
                XCTFail("error: \(error)")
            }
        }
    }
    
}

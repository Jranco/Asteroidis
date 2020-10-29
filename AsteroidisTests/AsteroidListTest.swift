//
//  AsteroidListTest.swift
//  AsteroidisTests
//
//  Created by Thomas Segkoulis on 29/10/20.
//  Copyright © 2020 Thomas Segkoulis. All rights reserved.
//

import XCTest
@testable import Asteroidis

class AsteroidListTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_shouldDecodeList() throws {
        
        /// given
        let bundle = Bundle(for: self.classForCoder)
        let path = bundle.path(forResource: "asteroid_list", ofType: "json")
        let data = try! Data(contentsOf: URL(fileURLWithPath: path!))
        
        /// when
        let objects = try! JSONDecoder().decode(AsteroidList.self, from: data)
        
        /// then
        XCTAssertEqual(objects.elementCount, 17)
        XCTAssertNotNil(objects.links.next)
        XCTAssertNotNil(objects.links.prev)
        XCTAssertEqual(objects.links.`self`, "http://www.neowsapp.com/rest/v1/feed?start_date=2020-10-19&end_date=2020-10-19&detailed=false&api_key=DEMO_KEY")
        /// TODO: add some more asserts
    }
    
    func test_shouldFailToDecodeList() {
        // TODO:
    }

}

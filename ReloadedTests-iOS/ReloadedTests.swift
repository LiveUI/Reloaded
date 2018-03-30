//
//  ReloadedTests.swift
//  ReloadedTests-iOS
//
//  Created by Ondrej Rafaj on 30/03/2018.
//  Copyright © 2018 LiveUI. All rights reserved.
//

import XCTest
@testable import Demo_iOS
import ReloadedTestTools


class ReloadedTests2: XCTestCase {
    
    override func setUp() {
        super.setUp()
        
        Setup.do()
    }
    
    override func tearDown() {
        Setup.clean()
        
        super.tearDown()
    }
    
    func testExample() {
        let count = try! Snowman.count()
        XCTAssertEqual(count, 50, "There has to be 50 beautiful snowman")
    }
    
}

//
//  ReloadedTests.swift
//  ReloadedTests
//
//  Created by Ondrej Rafaj on 29/03/2018.
//  Copyright © 2018 LiveUI. All rights reserved.
//

import XCTest
import Reloaded

class ReloadedTests: XCTestCase {
    
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

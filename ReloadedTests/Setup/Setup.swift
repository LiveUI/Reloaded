//
//  Setup.swift
//  ReloadedTests
//
//  Created by Ondrej Rafaj on 29/03/2018.
//  Copyright © 2018 LiveUI. All rights reserved.
//

import Foundation
@testable import ReloadedTestsHoldingApp
import ReloadedTestTools


extension Snowman: Entity { }


class Setup {
    
    static func `do`() {
        CoreData.default.mock(forBundleWithClass: AppDelegate.self)
        
        var lastCarrot = true
        for i: Int in 0...50 {
            let snowman = try! Snowman.new()
            snowman.name = "Snowman no.: \(i + 1)"
            snowman.hasCarrot = lastCarrot
            snowman.height = Int16(100 + i)
            lastCarrot = !lastCarrot
        }
    }
    
    static func clean() {
        let deleteReqest = NSBatchDeleteRequest(fetchRequest: Snowman.fetchRequest())
        try! CoreData.managedContext.execute(deleteReqest)
    }
    
}

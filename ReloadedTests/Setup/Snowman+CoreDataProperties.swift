//
//  Snowman+CoreDataProperties.swift
//  ReloadedTests
//
//  Created by Ondrej Rafaj on 29/03/2018.
//  Copyright © 2018 LiveUI. All rights reserved.
//
//

import Foundation
import CoreData


extension Snowman {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Snowman> {
        return NSFetchRequest<Snowman>(entityName: "Snowman")
    }

    @NSManaged public var name: String?
    @NSManaged public var height: Int16
    @NSManaged public var hasCarrot: Bool

}

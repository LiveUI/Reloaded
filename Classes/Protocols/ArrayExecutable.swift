//
//  ArrayExecutable.swift
//  Reloaded
//
//  Created by Ondrej Rafaj on 05/04/2018.
//  Copyright © 2018 LiveUI. All rights reserved.
//

import Foundation


/// Define interface for query builder
public protocol ArrayExecutable: Queryable {
    associatedtype QueryEntityType
    var data: [QueryEntityType] { get }
}


extension ArrayExecutable {
    
    /// Return all items for generated fetch request
    public func all(on context: NSManagedObjectContext = CoreData.managedContext) throws -> [QueryEntityType] {
        if let predicate = filters.asPredicate() {
            return NSArray(array: data).filtered(using: predicate)
        }
    }
    
    /// Return count for generated fetch request
    public func count(on context: NSManagedObjectContext = CoreData.managedContext) throws -> Int {
        return 1
    }
    
    /// Return first item from a generated fetch request
    public func first(on context: NSManagedObjectContext = CoreData.managedContext) throws -> QueryEntityType? {
        return data.first
    }
    
}

//
//  CoreDataExecutable.swift
//  Reloaded
//
//  Created by Ondrej Rafaj on 29/03/2018.
//  Copyright © 2018 LiveUI. All rights reserved.
//

import Foundation
@_exported import CoreData


/// Define interface for query builder
public protocol CoreDataExecutable: Queryable {
    associatedtype EntityType: Entity
    
    var entity: EntityType.Type { get }
    
    init(_ entityType: EntityType.Type)
    func fetchRequest() -> Entity.Request
}


extension CoreDataExecutable {
    
    /// Get compiled fetch request
    public func fetchRequest() -> Entity.Request {
        let fetch = Entity.Request(entityName: entity.entityName)
        fetch.predicate = filters.asPredicate()
        if !sorts.isEmpty {
            fetch.sortDescriptors = sorts.asSortDescriptors()
        }
        if let limit = limit {
            fetch.fetchLimit = limit
        }
        return fetch
    }

}

extension CoreDataExecutable where EntityType: NSManagedObject {
    
    /// Return all items for generated fetch request
    public func all(on context: NSManagedObjectContext = CoreData.managedContext) throws -> [EntityType] {
        guard let data = try context.fetch(fetchRequest()) as? [EntityType] else {
            return []
        }
        return data
    }
    
    /// Delete all items for generated fetch request
    public func delete(on context: NSManagedObjectContext = CoreData.managedContext) throws {
        for object in try all(on: context) {
            try object.delete(on: context)
        }
        try context.save()
    }
    
    /// Return count for generated fetch request
    public func count(on context: NSManagedObjectContext = CoreData.managedContext) throws -> Int {
        return try context.count(for: fetchRequest())
    }
    
    /// Return first item from a generated fetch request
    public func first(on context: NSManagedObjectContext = CoreData.managedContext) throws -> EntityType? {
        return try context.fetch(fetchRequest()).first as? EntityType
    }
    
}

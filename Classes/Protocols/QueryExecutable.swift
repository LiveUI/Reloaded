//
//  QueryExecutable.swift
//  Reloaded
//
//  Created by Ondrej Rafaj on 29/03/2018.
//  Copyright © 2018 LiveUI. All rights reserved.
//

import Foundation
import CoreData


public protocol QueryExecutable {
    associatedtype EntityType: Entity
    
    var entity: EntityType.Type { get }
    
    var filters: [QueryFilter] { get set }
    var sorts: [QuerySort] { get set }
    var limit: Int? { get set }
    
    init(_ entityType: EntityType.Type)
    func fetchRequest() -> Entity.Request
}


extension QueryExecutable {
    
    /// Get compiled fetch request
    public func fetchRequest() -> Entity.Request {
        let fetch = Entity.Request(entityName: entity.entityName)
        if !filters.isEmpty {
            if filters.count == 1, let filter = filters.first {
                fetch.predicate = filter.predicate()
            } else {
                
            }
        }
        return fetch
    }
    
    public func all(on context: NSManagedObjectContext = CoreData.managedContext) throws -> [EntityType] {
        guard let data = try context.fetch(fetchRequest()) as? [EntityType] else {
            return []
        }
        return data
    }
    
    public func count(on context: NSManagedObjectContext = CoreData.managedContext) throws -> Int {
        return try context.count(for: fetchRequest())
    }
    
    public func first(on context: NSManagedObjectContext = CoreData.managedContext) throws -> EntityType? {
        return try context.fetch(fetchRequest()).first as? EntityType
    }
    
}

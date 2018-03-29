//
//  QueryConvertible.swift
//  Reloaded
//
//  Created by Ondrej Rafaj on 29/03/2018.
//  Copyright © 2018 LiveUI. All rights reserved.
//

import Foundation
import CoreData


public protocol QueryConvertible {
    associatedtype EntityType: Entity
    
    var entity: EntityType.Type { get }
    
    var filters: [QueryFilter] { get set }
    var sorts: [QuerySort] { get set }
    
    init(_ entityType: EntityType.Type)
    func fetchRequest() -> Entity.Request
}


extension QueryConvertible {
    
    /// Get compiled fetch request
    public func fetchRequest() -> Entity.Request {
        let fetch = Entity.Request(entityName: entity.entityName)
        // TODO: Do the fetch
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

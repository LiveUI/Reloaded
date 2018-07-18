//
//  QueryExecutable+Threading.swift
//  Reloaded
//
//  Created by Ondrej Rafaj on 10/05/2018.
//  Copyright © 2018 LiveUI. All rights reserved.
//

import Foundation
import CoreData


extension QueryExecutable where EntityType: NSManagedObject {
    
    /// Return all data based on your query
    public func all(on queue: DispatchQueue = .main) -> CoreDataPromise<[EntityType]> {
        // Create or get the right context for the desired queue
        // Execute query on the thread for the context
        // Fulfill promise
        // Dispose of the context if no-one is using it anymore
        fatalError()
    }
    
    /// Delete all data captured by your query
    public func delete(on queue: DispatchQueue = .main) -> CoreDataPromise<Void> {
        // All above +
        // Update all contexts
        fatalError()
    }
    
    /// Count the number of items in your query
    public func count(on queue: DispatchQueue = .main) -> CoreDataPromise<Int>{
        fatalError()
    }
    
    /// Get first result of your query
    public func first(on queue: DispatchQueue = .main) -> CoreDataPromise<EntityType?> {
        fatalError()
    }
    
}

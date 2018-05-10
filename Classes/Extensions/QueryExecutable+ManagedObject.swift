//
//  QueryExecutable+ManagedObject.swift
//  Reloaded
//
//  Created by Ondrej Rafaj on 10/05/2018.
//  Copyright © 2018 LiveUI. All rights reserved.
//

import Foundation
import CoreData


extension QueryExecutable where EntityType: NSManagedObject {
    
    /// Return all data based on your query
    public func all(on context: NSManagedObjectContext = CoreData.managedContext) throws -> [EntityType] {
        guard let data = try context.fetch(fetchRequest()) as? [EntityType] else {
            return []
        }
        return data
    }
    
    /// Delete all data captured by your query
    public func delete(on context: NSManagedObjectContext = CoreData.managedContext) throws {
        for object in try all(on: context) {
            try object.delete(on: context)
        }
        try context.save()
        
        // TODO: Fix the following batch request!
        //        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest())
        //        do {
        //            let batchDeleteResult = try context.execute(deleteRequest) as! NSBatchDeleteResult
        //            print("The batch delete request has deleted \(batchDeleteResult.result!) records.")
        //        } catch {
        //            let updateError = error as NSError
        //            print("\(updateError), \(updateError.userInfo)")
        //        }
    }
    
    /// Count the number of items in your query
    public func count(on context: NSManagedObjectContext = CoreData.managedContext) throws -> Int {
        return try context.count(for: fetchRequest())
    }
    
    /// Get first result of your query
    public func first(on context: NSManagedObjectContext = CoreData.managedContext) throws -> EntityType? {
        return try context.fetch(fetchRequest()).first as? EntityType
    }
    
}

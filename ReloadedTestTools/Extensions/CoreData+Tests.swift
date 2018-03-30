//
//  CoreData+Tests.swift
//  ReloadedTestTools-macOS
//
//  Created by Ondrej Rafaj on 30/03/2018.
//  Copyright © 2018 LiveUI. All rights reserved.
//

import Foundation
@_exported @testable import Reloaded

extension CoreData {
    
    public func mock(forBundleWithClass c: AnyClass) {
        let managedObjectModel = NSManagedObjectModel.mergedModel(from: [Bundle(for: type(of: c))] )!
        
        let container = NSPersistentContainer(name: containerName, managedObjectModel: managedObjectModel)
        let description = NSPersistentStoreDescription()
        description.type = NSInMemoryStoreType
        description.shouldAddStoreAsynchronously = false // Make it simpler in test env
        
        container.persistentStoreDescriptions = [description]
        container.loadPersistentStores { (description, error) in
            // Check if the data store is in memory
            precondition( description.type == NSInMemoryStoreType )
            
            // Check if creating container wrong
            if let error = error {
                fatalError("Create an in-memory coordinator failed \(error)")
            }
        }
        persistentContainer = container
    }
    
}

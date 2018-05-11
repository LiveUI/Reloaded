//
//  CoreData.swift
//  Reloaded
//
//  Created by Ondrej Rafaj on 29/03/2018.
//  Copyright © 2018 LiveUI. All rights reserved.
//

import Foundation
@_exported import CoreData


public class CoreData {
    
    /// Custom CoreData errors
    public enum Problem: Error {
        case unableToCreateEntity
        case badData
        case invalidPersistentStoreCoordinator
    }
    
    /// Default implementation, should be sufficient in most cases
    public static let `default` = CoreData()
    
    /// Fallback container name, overrides bundle name globally
    /// Use in multitarget apps with shared model
    public static var fallbackContainerName: String?
    
    /// Container name
    let containerName: String
    
    // MARK: Initialization
    
    /// Initialize CoreData with an optional NSPersistentContainer name.
    /// App name will be used as default if nil
    public init(containerName: String? = nil) {
        guard let containerName = containerName ?? CoreData.fallbackContainerName ?? Bundle.main.object(forInfoDictionaryKey: kCFBundleNameKey as String) as? String else {
            fatalError("CoreData container name is not set and can not be inferred")
        }
        self.containerName = containerName
    }
    
    // MARK: Basic methods
    
    private var _privateManagedContext: NSManagedObjectContext?
    private var _managedContext: NSManagedObjectContext?
    
    /// Private managed object context for this instance
    public lazy var privateManagedContext: NSManagedObjectContext = {
        guard let privateManagedContext = _privateManagedContext else {
            // Create a background managed context as root context so the
            // main thread should not be blocked on more expensive opersations
            let privateManagedContext = persistentContainer.newBackgroundContext()
            _privateManagedContext = privateManagedContext
            return privateManagedContext
        }
        return privateManagedContext
    }()
    
    /// Managed context for this instance
    public lazy var managedContext: NSManagedObjectContext = {
        guard let managedContext = _managedContext else {
            let managedContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
            managedContext.parent = privateManagedContext
            _managedContext = managedContext
            return managedContext
        }
        return managedContext
    }()
    
    /// Default managed context
    public static var managedContext: NSManagedObjectContext {
        return CoreData.default.managedContext
    }
    
    /// Create new entry on the default context
    public static func new<T>(_ entityClass: T.Type, on context: NSManagedObjectContext = CoreData.managedContext) throws -> T where T: Entity {
        let o = NSEntityDescription.insertNewObject(forEntityName: T.entityName, into: context)
        guard let object = o as? T else {
            throw Problem.unableToCreateEntity
        }
        return object
    }
    
    // MARK: Default CoreData stuff
    
    /// Persistent connector for this instance
    public lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: containerName)
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: CoreData save support
    
    /// Save managed context if it has changes
    public func saveContext() throws {
        try CoreData.save(context: privateManagedContext)
    }
    
    /// Save default managed context if it has changes
    public static func saveContext() throws {
        try CoreData.default.saveContext()
    }
    
    // MARK: Private interface
    
    /// Save context, private helper
    private static func save(context: NSManagedObjectContext) throws {
        if context.hasChanges {
            try context.save()
        }
    }
    
}

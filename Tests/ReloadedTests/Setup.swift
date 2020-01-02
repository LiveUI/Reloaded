@testable import Reloaded


class Setup {
    
    static func `do`() {
        CoreData.default.mock(forBundleWithClass: AppDelegate.self)
        
        let colors = ["green", "red", "yellow", "pink", "blue", "gray", "cyan", "orange", "black", "rainbow"]
        
        var hasChimney = true
        for color in colors {
            for _ in 1...5 {
                let snowman = try! Locomotive.new()
                snowman.color = color
                snowman.hasChimney = hasChimney
                hasChimney = !hasChimney
            }
        }
    }
    
    static func clean() {
        try! Locomotive.deleteAll()
    }
    
}



extension CoreData {
    
    public func mock(forBundleWithClass bundleClass: AnyClass) {
        let bundle = Bundle(for: bundleClass)
        let managedObjectModel = NSManagedObjectModel.mergedModel(from: [bundle] )!
        
        let container = NSPersistentContainer(name: containerName, managedObjectModel: managedObjectModel)
        let description = NSPersistentStoreDescription()
        description.type = NSInMemoryStoreType
        description.shouldAddStoreAsynchronously = false // Make it simpler in test env
        
        container.persistentStoreDescriptions = [description]
        container.loadPersistentStores { (description, error) in
            // Check if the data store is in memory
            precondition(description.type == NSInMemoryStoreType)
            
            // Check if creating container wrong
            if let error = error {
                fatalError("Create an in-memory coordinator failed \(error)")
            }
        }
        persistentContainer = container
    }
    
}

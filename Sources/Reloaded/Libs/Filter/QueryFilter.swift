import Foundation


/// Defines a `Filter` that can be added on fetch operations to limit the set of data affected.
public struct QueryFilter {
    
    /// The field to filer.
    public var field: QueryField
    
    /// The filter type.
    public var type: QueryFilterType
    
    /// The filter value, possible another field.
    public var value: QueryDataRepresentable
    
    /// Case sensitivity in text searches
    public var caseSensitive: Bool
    
    /// Create a new filter.
    public init(field: QueryField, type: QueryFilterType, value: QueryDataRepresentable, caseSensitive: Bool = true) {
        self.field = field
        self.type = type
        self.value = value
        self.caseSensitive = caseSensitive
    }
    
}


extension QueryFilter {
    
    /// Convert filter to predicate
    public func asPredicate() -> NSPredicate {
        if let value = value as? String {
            let predicate = NSPredicate(format: "\(field.name) \(type.interpretation)\(caseSensitive ? "" : "[c]") %@", value)
            return predicate
        } else if let value = value as? Bool {
            let predicate = NSPredicate(format: "\(field.name) \(type.interpretation) %@", NSNumber(booleanLiteral: value))
            return predicate
        } else if let value = value as? LosslessStringConvertible {
            let predicate = NSPredicate(format: "\(field.name) \(type.interpretation) \(value)")
            return predicate
        } else if let value = value as? Date {
            let predicate = NSPredicate(format: "\(field.name) \(type.interpretation) %@", value as CVarArg)
            return predicate
        } else if let _ = value as? NULL  {
            let predicate = NSPredicate(format: "\(field.name) \(type.interpretation) nil")
            return predicate
        }
        fatalError("Not implemented")
    }
    
}

import Foundation


/// Represents a field and its optional entity in a query.
/// This is used mostly for query filters.
public struct QueryField: Hashable {
    
    /// See `Hashable.hashValue`
//    public var hashValue: Int {
//        return name.hashValue
//    }
    
    /// See `Equatable.==`
    public static func ==(lhs: QueryField, rhs: QueryField) -> Bool {
        return lhs.name == rhs.name
    }
    
    /// The name of the field.
    public var name: String
    
    /// Create a new query field.
    public init(name: String) {
        self.name = name
    }
    
}

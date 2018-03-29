//
//  Filters.swift
//  Reloaded
//
//  Created by Ondrej Rafaj on 29/03/2018.
//  Copyright © 2018 LiveUI. All rights reserved.
//

import Foundation


/// Defines a `Filter` that can be added on fetch operations to limit the set of data affected.
public struct QueryFilter {
    /// The field to filer.
    public var field: QueryField
    
    /// The filter type.
    public var type: QueryFilterType
    
    /// The filter value, possible another field.
    public var value: QueryDataRepresentable
    
    /// Create a new filter.
    public init(field: QueryField, type: QueryFilterType, value: QueryDataRepresentable) {
        self.field = field
        self.type = type
        self.value = value
    }
}


extension Query {
    
    /// Basic filter
    @discardableResult public func filter(_ filter: QueryFilter ...) -> Self {
        filters.append(contentsOf: filter)
        return self
    }
    
}

/// field == value
public func == (lhs: String, rhs: QueryDataRepresentable) -> QueryFilter {
    return _compare(lhs, .equals, rhs)
}
public func == (lhs: String, rhs: QueryDataRepresentable?) -> QueryFilter {
    return _compare(lhs, .equals, rhs)
}

/// field != value
public func != (lhs: String, rhs: QueryDataRepresentable) -> QueryFilter {
    return _compare(lhs, .notEquals, rhs)
}
public func != (lhs: String, rhs: QueryDataRepresentable?) -> QueryFilter {
    return _compare(lhs, .notEquals, rhs)
}

/// field > value
public func > (lhs: String, rhs: QueryDataRepresentable) -> QueryFilter {
    return _compare(lhs, .greaterThan, rhs)
}
public func > (lhs: String, rhs: QueryDataRepresentable?) -> QueryFilter {
    return _compare(lhs, .greaterThan, rhs)
}

/// field < value
public func < (lhs: String, rhs: QueryDataRepresentable) -> QueryFilter {
    return _compare(lhs, .lessThan, rhs)
}
public func < (lhs: String, rhs: QueryDataRepresentable?) -> QueryFilter {
    return _compare(lhs, .lessThan, rhs)
}

/// field >= value
public func >= (lhs: String, rhs: QueryDataRepresentable) -> QueryFilter {
    return _compare(lhs, .greaterThanOrEquals, rhs)
}
public func >= (lhs: String, rhs: QueryDataRepresentable?) -> QueryFilter {
    return _compare(lhs, .greaterThanOrEquals, rhs)
}

/// field <= value
public func <= (lhs: String, rhs: QueryDataRepresentable) -> QueryFilter {
    return _compare(lhs, .lessThanOrEquals,  rhs)
}
public func <= (lhs: String, rhs: QueryDataRepresentable?) -> QueryFilter {
    return _compare(lhs, .lessThanOrEquals, rhs)
}

private func _compare(_ lhs: String, _ comparison: QueryFilterType, _ rhs: QueryDataRepresentable?) -> QueryFilter {
    return QueryFilter(field: QueryField(name: lhs), type: comparison, value: rhs ?? NULL())
}




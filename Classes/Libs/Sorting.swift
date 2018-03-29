//
//  Sorting.swift
//  Reloaded
//
//  Created by Ondrej Rafaj on 29/03/2018.
//  Copyright © 2018 LiveUI. All rights reserved.
//

import Foundation


/// Sorts results based on a field and direction.
public struct QuerySort {
    /// The field to sort.
    public let field: QueryField
    
    /// The direction to sort by.
    public let direction: ComparisonResult
    
    /// Create a new sort
    public init(
        field: QueryField,
        direction: ComparisonResult
        ) {
        self.field = field
        self.direction = direction
    }
}


extension Query {
    
    /// Sort by
    @discardableResult public func sort(sort: QuerySort) -> Self {
        sorts.append(sort)
        return self
    }
    
    /// Sort by an array of QuerySort
    @discardableResult public func sort(sort: [QuerySort]) -> Self {
        sorts.append(contentsOf: sort)
        return self
    }
    
    /// Sort by an array of QuerySort
    @discardableResult public func sort(sort: QuerySort ...) -> Self {
        sorts.append(contentsOf: sort)
        return self
    }
    
//    @discardableResult public func sort<E, T>(by keyPath: ReferenceWritableKeyPath<E, T?> , direction: QuerySortDirection = .ascending) -> Self where E: AnyEntity {
//        return self
//    }
    
    /// Sort by a field and direction
    @discardableResult public func sort(by field: String , direction: ComparisonResult = .orderedAscending) -> Self {
        guard direction != .orderedSame else {
            return self
        }
        self.sort(sort: QuerySort(field: QueryField(name: field), direction: direction))
        return self
    }
    
    /// Sort by an array of fields and directions
    @discardableResult public func sort(by sort: (field: String , direction: ComparisonResult) ...) -> Self {
        self.sort(sort: sort.map({
            QuerySort(field: QueryField(name: $0.field), direction: $0.direction)
        }))
        return self
    }

}

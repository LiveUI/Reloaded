//
//  QueryFilterValue.swift
//  Reloaded
//
//  Created by Ondrej Rafaj on 29/03/2018.
//  Copyright © 2018 LiveUI. All rights reserved.
//

import Foundation


/// Describes the values a subset can have.
public struct QueryFilterValue {
    
    enum QueryFilterValueStorage {
        case field(QueryField)
        case array([QueryDataRepresentable])
        case none
    }
    
    /// Internal storage.
    let storage: QueryFilterValueStorage
    
    /// Returns the `QueryField` value if it exists.
    public func field() -> QueryField? {
        switch storage {
        case .field(let field): return field
        default: return nil
        }
    }
    
    /// Query field.
    public static func field(_ field: QueryField) -> QueryFilterValue {
        return .init(storage: .field(field))
    }

    /// An array of supported values
    public static func array<T>(_ array: [T]) throws -> QueryFilterValue where T: QueryDataRepresentable {
        return .init(storage: .array(array))
    }
    
    /// No value.
    public static func none() -> QueryFilterValue {
        return .init(storage: .none)
    }
}

//
//  QueryDataRepresentable.swift
//  Reloaded
//
//  Created by Ondrej Rafaj on 29/03/2018.
//  Copyright © 2018 LiveUI. All rights reserved.
//

import Foundation


public protocol QueryDataRepresentable {
//    var value: String { get }
    var isNull: Bool { get }
}


public protocol NumericQueryDataRepresentable: QueryDataRepresentable { }
public protocol StringQueryDataRepresentable: QueryDataRepresentable { }
public protocol ExactQueryDataRepresentable: QueryDataRepresentable {
    var value: String { get }
}

extension QueryDataRepresentable {
    
    public var isNull: Bool {
        return false
    }
    
}

struct NULL: ExactQueryDataRepresentable {
    
    var value: String {
        return "NULL"
    }
    
    var isNull: Bool {
        return true
    }
    
}

extension Bool: ExactQueryDataRepresentable {
    
    public var value: String {
        return self ? "true" : "false"
    }
    
}

extension String: StringQueryDataRepresentable { }
extension Int: NumericQueryDataRepresentable { }
extension Int16: NumericQueryDataRepresentable { }
extension Bool: NumericQueryDataRepresentable { }

//
//  QueryDataRepresentable.swift
//  Reloaded
//
//  Created by Ondrej Rafaj on 29/03/2018.
//  Copyright © 2018 LiveUI. All rights reserved.
//

import Foundation


public protocol QueryDataRepresentable {
    var value: String { get }
    var isNull: Bool { get }
}

extension QueryDataRepresentable {
    
    public var isNull: Bool {
        return false
    }
    
}

struct NULL: QueryDataRepresentable {
    
    var value: String {
        return ""
    }
    
    var isNull: Bool {
        return true
    }
    
}

extension String: QueryDataRepresentable {
    
    public var value: String {
        return self
    }
    
}

extension Int: QueryDataRepresentable {
    
    public var value: String {
        return String(self)
    }
    
}

extension Bool: QueryDataRepresentable {
    
    public var value: String {
        return String(self)
    }
    
}

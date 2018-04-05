//
//  ArrayQuery.swift
//  Reloaded
//
//  Created by Ondrej Rafaj on 05/04/2018.
//  Copyright © 2018 LiveUI. All rights reserved.
//

import Foundation


/// Root query available for arrays
public class ArrayQuery<QueryEntityType>: ArrayExecutable {
    
    /// Array content container
    public let data: [QueryEntityType]
    
    /// Query filters separated in logical groups
    public var filters: [QueryFilterGroup] = []
    
    /// Sorting results of the query
    public var sorts: [QuerySort] = []
    
    /// Limit the number of items
    public var limit: Int?
    
    /// Initialization
    public required init(_ data: [QueryEntityType]) {
        self.data = data
    }
    
}


extension Array where Element: AnyObject {
    
    public var query: ArrayQuery<Element> {
        return ArrayQuery(self)
    }
    
}

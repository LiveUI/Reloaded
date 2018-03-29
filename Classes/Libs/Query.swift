//
//  Query.swift
//  Reloaded
//
//  Created by Ondrej Rafaj on 29/03/2018.
//  Copyright © 2018 LiveUI. All rights reserved.
//

import Foundation


public class Query<QueryEntityType>: QueryExecutable where QueryEntityType: Entity {
    
    public var entity: QueryEntityType.Type
    
    public var filters: [QueryFilter] = []
    public var sorts: [QuerySort] = []
    public var limit: Int?
    
    public var predicate: NSPredicate? = nil
    
    public required init(_ entityType: QueryEntityType.Type) {
        self.entity = entityType
    }
    
}

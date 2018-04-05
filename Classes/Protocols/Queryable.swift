//
//  Queryable.swift
//  Reloaded
//
//  Created by Ondrej Rafaj on 05/04/2018.
//  Copyright © 2018 LiveUI. All rights reserved.
//

import Foundation


/// Interface for queryable object
public protocol Queryable {
    var filters: [QueryFilterGroup] { get set }
    var sorts: [QuerySort] { get set }
    var limit: Int? { get set }
}

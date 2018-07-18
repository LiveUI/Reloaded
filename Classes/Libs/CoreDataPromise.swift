//
//  CoreDataPromise.swift
//  Reloaded
//
//  Created by Ondrej Rafaj on 10/05/2018.
//  Copyright © 2018 LiveUI. All rights reserved.
//

import Foundation


public class CoreDataPromise<Expectation> {
    
    public internal(set) var expectation: Expectation? {
        didSet {
            if let expectation = expectation {
                thenPromiseClosure?(expectation)
                mapPromise?.expectation = mapPromiseClosure?(expectation)
            }
        }
    }
    
    /// Then closure type
    public typealias ThenPromise = ((Expectation) -> Void)
    
    /// Map closure type
    public typealias MapPromise<T> = ((Expectation) -> T)
    
    var thenPromiseClosure: ThenPromise?
    
    /// Executes when operation is finished
    public func then(_ promise: @escaping ThenPromise) -> Self {
        thenPromiseClosure = promise
        return self
    }
    
    var mapPromiseClosure: MapPromise<Any>?
    var mapPromise: CoreDataPromise<Any>?
    
//    /// Executes when operation is finished to transform result to another type
//    public func map<T>(to: T.Type = T.self, _ promise: @escaping MapPromise<T>) -> CoreDataPromise<T> {
//        mapPromiseClosure = promise
//
//        let mapPromise = CoreDataPromise<T>()
//
//        return mapPromise
//    }

}

//
//  ServiceLocator.swift
//  
//
//  Created by Connor Cates on 5/10/22.
//

import Foundation

/// ServiceLocator
///
/// Stores a registry of services mapped with the type of the service
public class ServiceLocator {
    
    /// Registry of services registered to this locator
    private lazy var registry: [String: AnyObject] = [:]

    /// Register a service to the service locator
    ///
    /// - parameter service the service you wishe to register
    ///
    ///   `Example use:` locator.registerService(ServiceImplementation() as ServiceProtocol)
    public func registerService<T>(_ service: T) {
        let key = "\(type(of: service))"
        self.registry[key] = service as AnyObject
    }

    /// Provide a service for a given typee
    ///
    /// - returns an instance of the type requested
    public func provide<T>() -> T? {
        let key = "\(T.self)"
        return self.registry[key] as? T
    }
    
}

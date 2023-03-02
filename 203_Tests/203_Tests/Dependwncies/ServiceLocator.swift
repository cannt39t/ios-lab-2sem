//
//  ServiceLocator.swift
//  202_ServiceLayer
//
//  Created by Илья Казначеев on 02.03.2023.
//

import Foundation


class ServiceLocator {
    
    private var resolves: [String: () -> Any] = [:]
    
    func register<T>(_ resolver: @escaping () -> T) {
        let typeString = String(describing: T.self)
        resolves[typeString] = resolver
    }
    
    func resolve<T>() -> T {
        let typeString = String(describing: T.self)
        guard let resolver = resolves[typeString], let resolved = resolver() as? T else {
            fatalError("Fuck")
        }
        return resolved
    }
    
}

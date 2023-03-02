//
//  MockConfigurator.swift
//  202_ServiceLayer
//
//  Created by Илья Казначеев on 02.03.2023.
//

import Foundation

class MockConfigurator {
    
    func configure() -> ServiceLocator {
        let serviceLocator = ServiceLocator()
        
        let authService = MockAuthService()
        serviceLocator.register { () -> AuthService in
            authService
        }
        
        return serviceLocator
    }
    
}

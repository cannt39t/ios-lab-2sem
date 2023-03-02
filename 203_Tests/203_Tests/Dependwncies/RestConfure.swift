//
//  RestConfure.swift
//  202_ServiceLayer
//
//  Created by Илья Казначеев on 02.03.2023.
//

import Foundation

class RestConfure {
    
    func configure() -> ServiceLocator {
        let serviceLocator = ServiceLocator()
        
        let authService = RestAuthService()
        serviceLocator.register { () -> AuthService in
            authService
        }
        
        return serviceLocator
    }
    
}

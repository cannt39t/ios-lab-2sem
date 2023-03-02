//
//  ConfirmationPrenster.swift
//  202_ServiceLayer
//
//  Created by Илья Казначеев on 02.03.2023.
//

import Foundation

class ConfirmationPrenster {
    
    private let authService: AuthService
    
    init(authService: AuthService) {
        self.authService = authService
    }
    
    func confirm() {
        Task {
            await authService.confirmSignIn()
        }
    }
    
}

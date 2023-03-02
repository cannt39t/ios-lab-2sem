//
//  RestAuth.swift
//  202_ServiceLayer
//
//  Created by Илья Казначеев on 02.03.2023.
//

import Foundation
import Combine

class RestAuthService: AuthService {
    func confirmSignIn() async {
        _isAuthorized.value = true
    }
    
    
    static let shared: MockAuthService = .init()
    
    private var _isAuthorized: CurrentValueSubject<Bool, Never> = .init(false)
    
    var isAuthorized: AnyPublisher<Bool, Never> {
        _isAuthorized
            .removeDuplicates()
            .eraseToAnyPublisher()
    }
    
    func signIn(login: String, password: String) async throws {
        try await Task.sleep(for: .seconds(1))
        if !(login == "admin" && password == "qwerty") {
            _isAuthorized.value = false
            throw AuthError.unauthorized
        } else {
            _isAuthorized.value = true
        }
    }
    
    func signOut() {
        _isAuthorized.value = false
    }
    
}

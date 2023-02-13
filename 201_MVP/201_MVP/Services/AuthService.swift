//
//  AuthService.swift
//  201_MVP
//
//  Created by Илья Казначеев on 12.02.2023.
//

import Foundation
import Combine

enum AuthError: Error {
    case unauthorized
}

protocol AuthService {
    
    var isAuthorized: AnyPublisher<Bool, Never> { get }
    func signIn(login: String, password: String) async throws
    func signOut()
    
}


class MockAuthService: AuthService {
    
    static let shared: MockAuthService = .init()
    
    private var _isAuthorized: CurrentValueSubject<Bool, Never> = .init(true)
    
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

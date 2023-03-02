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
    case confirmRequired
}

protocol AuthService {
    var isAuthorized: AnyPublisher<Bool, Never> { get }
    
    func signIn(login: String, password: String) async throws
    func confirmSignIn() async
    func signOut()
}




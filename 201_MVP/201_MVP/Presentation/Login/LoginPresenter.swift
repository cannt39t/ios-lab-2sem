//
//  LoginPresenter.swift
//  201_MVP
//
//  Created by Илья Казначеев on 12.02.2023.
//

import UIKit

class LoginPresenter {
    
    var authService: AuthService =  MockAuthService.shared
    
    weak var view: LoginViewController?
    
    @MainActor
    func logIn(login: String, password: String) {
        view?.showLoader()
        Task{
            do {
                try await authService.signIn(login: login, password: password)
            } catch {
                view?.show(error: error)
            }
            view?.hideLoader()
        }
    }
    
}

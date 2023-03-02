//
//  LoginPresenter.swift
//  201_MVP
//
//  Created by Илья Казначеев on 12.02.2023.
//

import UIKit

class LoginPresenter {
    
    private var authService: AuthService!
    private weak var view: LoginViewController?
    private var confirmSignIn: () -> Void = {}
    
    init(authService: AuthService, view: LoginViewController, confirmSignIn: @escaping () -> Void) {
        self.authService = authService
        self.view = view
        self.confirmSignIn = confirmSignIn
    }
    
    @MainActor
    func logIn(login: String, password: String) {
        view?.showLoader()
        Task{
            do {
                try await authService.signIn(login: login, password: password)
            } catch AuthError.confirmRequired {
                confirmSignIn()
            } catch {
                view?.show(error: error)
            }
            view?.hideLoader()
        }
    }
    
}

//
//  SignInCoordinator.swift
//  202_ServiceLayer
//
//  Created by Илья Казначеев on 02.03.2023.
//

import UIKit

class SignInCoordinator {
    
    private let storyboard = UIStoryboard(name: "Main", bundle: nil)
    private weak var navigationController: UINavigationController?
    var services: ServiceLocator!
    
    
    @MainActor func start() -> UIViewController {
        let controller: LoginViewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        let presenter = LoginPresenter(authService: services.resolve(), view: controller, confirmSignIn: { [self] in
            showConfirmation()
        })
        controller.presenter = presenter
        let navigationController = UINavigationController(rootViewController: controller)
        self.navigationController = navigationController
        return navigationController
    }
    
    private func showConfirmation() {
        let controller: ConfirmationViewController = storyboard.instantiateViewController(withIdentifier: "ConfirmationViewController") as! ConfirmationViewController
        let presenter = ConfirmationPrenster(authService:  services.resolve())
        controller.presenter = presenter
        navigationController?.pushViewController(controller, animated: true)
    }
    
}



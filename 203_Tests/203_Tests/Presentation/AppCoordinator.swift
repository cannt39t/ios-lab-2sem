//
//  AppCoordinator.swift
//  201_MVP
//
//  Created by Илья Казначеев on 12.02.2023.
//

import UIKit
import Combine

@MainActor
class AppCoordinator {
    
    weak var window: UIWindow?
    static let shared: AppCoordinator = .init()
    lazy var authService: AuthService = services.resolve()
    
    var services: ServiceLocator!
    
    var authCancellable: Set<AnyCancellable> = []
    
    
    func start() {
        authService.isAuthorized
            .receive(on: DispatchQueue.main)
            .sink { [weak self] authorized in
                guard let self else { return }
                if authorized {
                    self.showAppContent()
                } else {
                    self.showAuthorization()
                }
                
            }
            .store(in: &authCancellable)
    }
    
    private let storyboard = UIStoryboard(name: "Main", bundle: nil)
    
    func showAuthorization() {
        let signInCoordinator = SignInCoordinator()
        signInCoordinator.services = services
        window?.rootViewController = signInCoordinator.start()
    }
    
    func showAppContent() {
        let tabbarCorrdinator = MainTabBarCoordinator()
        window?.rootViewController = tabbarCorrdinator.start()
    }
    
}

//
//  MainTabBarCoordinator.swift
//  201_MVP
//
//  Created by Илья Казначеев on 12.02.2023.
//

import UIKit

class MainTabBarCoordinator {
    
    weak var tabBarController: UITabBarController?
    
    func start() -> UIViewController {
        let tabBarController = UITabBarController()
        self.tabBarController = tabBarController
        tabBarController.viewControllers = [shopping(), profile()]
        return tabBarController
    }
    
    private let storyboard = UIStoryboard(name: "Main", bundle: nil)
    
    private func shopping() -> UIViewController {
        let contoller = storyboard.instantiateViewController(withIdentifier: "CatalogViewController")
        contoller.tabBarItem = .init(title: "Catalog", image: UIImage(systemName: "cart"), selectedImage: UIImage(systemName: "cart.fill"))
        return contoller
    }
    
    private func profile() -> UIViewController {
        let contoller = storyboard.instantiateViewController(withIdentifier: "ProfileViewController")
        contoller.tabBarItem = .init(title: "Profile", image: UIImage(systemName: "person"), selectedImage: UIImage(systemName: "person.fill"))
        return contoller
    }
    
}


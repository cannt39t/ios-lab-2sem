//
//  CatalogCoordinator.swift
//  201_MVP
//
//  Created by Илья Казначеев on 13.02.2023.
//

import UIKit

class CatalogCoordinator {
    
    static let shared: CatalogCoordinator = .init()
    var authService = MockCatalogService.shared
    private var navigationController: UINavigationController?
    
    func start() -> UIViewController {
        let catalogViewController = CatalogViewController()
        let catalogPresenter = CatalogPresenterImpl()
        catalogViewController.tabBarItem = .init(title: "Catalog", image: UIImage(systemName: "cart"), selectedImage: UIImage(systemName: "cart.fill"))
        catalogViewController.presenter = catalogPresenter
        catalogPresenter.view = catalogViewController
        catalogPresenter.didSelectItem = showDetailInfo
        
        navigationController = UINavigationController(rootViewController: catalogViewController)
        return navigationController!
    }
    
    func showDetailInfo(product: Product) {
        let detailViewController = DetailViewController()
        detailViewController.setProduct(product: product)
        navigationController!.pushViewController(detailViewController, animated: true)
    }
    
}

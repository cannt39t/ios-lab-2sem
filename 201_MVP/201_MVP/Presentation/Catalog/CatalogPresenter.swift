//
//  CatalogPresenter.swift
//  201_MVP
//
//  Created by Илья Казначеев on 13.02.2023.
//

import UIKit

struct Product {
    
    let id: Int
    let name: String
    let description: String
    let price: Float
    
}

protocol CatalogPresenter {
    var view: CatalogView? { get set }
    var products: [Product]? { get }
    func loadProducts()
    func didSelectProduct(at index: Int)
}

class CatalogPresenterImpl: CatalogPresenter {
    var view: CatalogView?
    var products: [Product]?
    
    private let catalogService = MockCatalogService.shared
    
    func loadProducts() {
        products = []
        do {
            products = try catalogService.fetchProducts()
        } catch {
            view?.showError(error)
        }
    }
    
    func didSelectProduct(at index: Int) {
        CatalogCoordinator.shared.showDetailInfo(product: products![index])
    }
}

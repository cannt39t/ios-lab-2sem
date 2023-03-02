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

protocol CatalogPresenter: AnyObject {
    var products: [Product] { get }
    func loadProducts()
    func didSelectProduct(at index: Int)
}

class CatalogPresenterImpl: CatalogPresenter {
    weak var view: CatalogView?
    var products: [Product] = []
    var didSelectItem: (Product) -> Void = { _ in }
    
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
        didSelectItem(products[index])
    }
}

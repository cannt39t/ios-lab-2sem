//
//  CatalogService.swift
//  201_MVP
//
//  Created by Илья Казначеев on 13.02.2023.
//

import Foundation

protocol CatalogService {
    
    func fetchProducts() throws -> [Product]
    
}

class MockCatalogService: CatalogService {
    
    static let shared = MockCatalogService()
    
    func fetchProducts() throws -> [Product] {
        return [
            Product(id: 1, name: "Product 1", description: "Description 1", price: 100),
            Product(id: 2, name: "Product 2", description: "Description 2", price: 200),
            Product(id: 3, name: "Product 3", description: "Description 3", price: 300),
            Product(id: 4, name: "Product 4", description: "Description 4", price: 300),
            Product(id: 5, name: "Product 5", description: "Description 5", price: 300),
            Product(id: 6, name: "Product 6", description: "Description 6", price: 300),
            Product(id: 7, name: "Product 7", description: "Description 7", price: 300)
        ]
        }
}

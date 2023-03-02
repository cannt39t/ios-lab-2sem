//
//  DetailViewController.swift
//  201_MVP
//
//  Created by Илья Казначеев on 13.02.2023.
//

import UIKit

class DetailViewController: UIViewController {
    
    private var nameLabel: UILabel = .init()
    private var descriptionLabel: UILabel = .init()
    private var priceLabel: UILabel = .init()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupLayout()
        view.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.968627451, alpha: 1)
    }
    
    func setProduct(product: Product) {
        nameLabel.text = product.name
        descriptionLabel.text = product.description
        priceLabel.text = "\(product.price)$"
    }
    
    private func setupLayout() {
        let stack = UIStackView(arrangedSubviews: [nameLabel, descriptionLabel, priceLabel])
        stack.axis = .vertical
        stack.spacing = 8
        stack.alignment = .center
        stack.distribution = .fillProportionally
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stack)
        
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            stack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
//            stack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
}

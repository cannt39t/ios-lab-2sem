//
//  ProductCollectionViewCell.swift
//  201_MVP
//
//  Created by Илья Казначеев on 13.02.2023.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    
    private let idLabel: UILabel = .init()
    private let nameLabel: UILabel = .init()
    private let priceLabel: UILabel = .init()
    
    public static let ID = "ProductCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        setup()
    }
    
    private func setup() {
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 16
        contentView.layer.masksToBounds = true
        
        let stack = UIStackView(arrangedSubviews: [idLabel, nameLabel, priceLabel])
        stack.axis = .vertical
        stack.spacing = 8
        stack.alignment = .center
        stack.distribution = .fillProportionally
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(stack)
        
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: contentView.topAnchor),
            stack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    public func setProduct(product: Product) {
        idLabel.text = "ID: \(product.id)"
        nameLabel.text = product.name
        priceLabel.text = "\(product.price)$"
    }
    
}

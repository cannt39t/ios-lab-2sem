//
//  CatalogViewController.swift
//  201_MVP
//
//  Created by Илья Казначеев on 12.02.2023.
//

import UIKit

protocol CatalogView {
    var presenter: CatalogPresenter? {get set}

    func showError(_ error: Error)
}

class CatalogViewController: UIViewController, CatalogView {
    var presenter: CatalogPresenter?
    
    var collectionView: UICollectionView!
    var source: [Product]?

    override func viewDidLoad() {
        super.viewDidLoad()

        presenter!.loadProducts()
        source = presenter?.products
        setupCollectionView()
        collectionView.reloadData()
        
        view.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.968627451, alpha: 1)
        title = "Catalog"
    }
    
    // MARK: CollectionView implementation
    
    func setupCollectionView() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: setupFlowLayout())
        collectionView.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.968627451, alpha: 1)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(ProductCollectionViewCell.self, forCellWithReuseIdentifier: ProductCollectionViewCell.ID)
    }
    
    func setupFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        
        let width = (UIScreen.main.bounds.width - 40) / 2
        layout.itemSize = CGSize(width: width, height: width)
        
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = .init(top: 10, left: 13, bottom: 10, right: 13)
        
        return layout
    }
    
    // MARK: Presenter implementation
    
    func showError(_ error: Error) {
        let alertController = UIAlertController(title: "OOOPS", message: "Something went wrong: \(error)", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .cancel))
        present(alertController, animated: true)
    }

}

extension CatalogViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        source?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCollectionViewCell.ID, for: indexPath) as? ProductCollectionViewCell else { fatalError() }
        let product = source![indexPath.item]
        cell.setProduct(product: product)
        return cell
    }
}


extension CatalogViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.didSelectProduct(at: indexPath.item)
    }
}

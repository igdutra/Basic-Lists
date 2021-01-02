//
//  ProductListViewModel.swift
//  productList
//
//  Created by Ivo Dutra on 02/01/21.
//

import Foundation

protocol ProductListViewModelProtocol {
    var products: [Product] { get set }
    var delegate: ProductListView? { get set }
}

class ProductListViewModel {
    
    // MARK: - Properties
    
    var products: [Product]
    var services: ProductsServiceProtocol
    /// ViewModel's Delegate is the View
    /// Should be weak to avoid retain cycle
    weak var delegate: ProductListViewModelDelegate?
    
    // MARK: - Init
    
    init(services: ProductsServiceProtocol, delegate: ProductListViewModelDelegate) {
        self.products = []
        self.services = services
        self.delegate = delegate
    
        getProducts()
    }
    
    // MARK: - Get products
    
    func getProducts() {
        services.getProducts { [weak self] (result) in
            guard let self = self else { return }
            // TODO: Bonus: activity indicator
            switch result {
            case .success(let products):
                self.products = products
                self.delegate?.reloadData() 
            case .failure:
                print("No Products were returned")
            }
        }
    }
}

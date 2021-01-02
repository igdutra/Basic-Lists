//
//  ProductListViewModel.swift
//  productList
//
//  Created by Ivo Dutra on 02/01/21.
//

import Foundation

class ProductListViewModel {
    
    // MARK: - Properties
    
    var products: [Product] = []
    /// ViewModel's Delegate is the View
    /// Should be weak to avoid retain cycle
    weak var delegate: ProductListView?
    
    // MARK: - Init
    
    init() {
        getProducts()
    }
    
    // MARK: - Get products
    
    func getProducts() {
        let service = ProductsService()
        service.getProducts { [weak self] (result) in
            guard let self = self else { return }
            // TODO: Bonus: activity indicator
            switch result {
            case .success(let products):
                self.products = products
                self.delegate?.reloadData() // TODO: search for other functions than reload data
            case .failure:
                print("No Products were returned")
            }
        }
    }
}

//
//  ProductListViewModel.swift
//  productList
//
//  Created by Ivo Dutra on 02/01/21.
//

import Foundation

protocol ProductListViewModelProtocol {
    // Product doesn't need to be inside protocol
    // Neither does services
    func getCount() -> Int
    func getProduct(at: Int) -> Product
    func createCellViewModel(from product: Product) -> ProductListCellViewModel
}

class ProductListViewModel: ProductListViewModelProtocol {
    
    // MARK: - Properties
    
    private var products: [Product]
    private var services: ProductsServiceProtocol
    /// ViewModel's Delegate is the View
    /// Should be weak to avoid retain cycle
    private weak var delegate: ProductListViewControllerDelegate?

    // MARK: - Init

    // Delegate is always referenced after the init.
    // No need to be in init
    init(services: ProductsServiceProtocol = ProductsService(),
         delegate: ProductListViewControllerDelegate?) {
        self.products = []
        self.services = services
        self.delegate = delegate

        getProducts()
    }
    
    // MARK: - Public Methods

    /// Retrieve all products from the API
    func getProducts() {
        // Start Animation
        services.getProducts { [weak self] (result) in
            // Stop animation
            guard let self = self else { return }
            switch result {
            case .success(let products):
                self.products = products
                self.delegate?.reloadData()
            case .failure:
                print("No Products were returned")
            }
        }
    }

    /// Products is now private
    /// Expose a public method to retrieve a private property
    func getCount() -> Int {
        products.count
    }

    /// For View's TableViewCell
    func getProduct(at row: Int) -> Product {
        products[row]
    }

    /// So that the ProductListView doesn't need to call the constructor from ProductListCellViewModel
    func createCellViewModel(from product: Product) -> ProductListCellViewModel {
        ProductListCellViewModel(product: product)
    }
}

//
//  ProductListViewController.swift
//  productList
//
//  Created by Ivo Dutra on 31/12/20.
//

import UIKit

class ProductListViewController: UIViewController {
    
    // MARK: - Properties
    
    private var products: [Product] = []
    private let cellId: String = "productListCell"
    
    private var myView: ProductListView {
        // swiftlint:disable force_cast
        return view as! ProductListView
        // swiftlint:enable force_cast
    }
    
    // MARK: - Life Cycle

    override func loadView() {
        let myView = ProductListView()
        self.view = myView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "MVC + ViewCode"
    }
    
    // MARK: - Get Products
    
    func getProducts() {
        let service = ProductsService()
        service.getProducts { [weak self] (result) in
            guard let self = self else { return }
            // TODO: Bonus: activity indicator
            switch result {
            case .success(let products):
                self.products = products
                self.myView.tableView.reloadData() // TODO: search for other functions than reload data
            case .failure:
                print("No Products were returned")
            }
        }
    }
}

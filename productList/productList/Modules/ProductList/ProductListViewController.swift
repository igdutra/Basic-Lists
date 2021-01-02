//
//  ProductListViewController.swift
//  productList
//
//  Created by Ivo Dutra on 31/12/20.
//

import UIKit

/// ViewController is now only responsible for instanciating View and ViewModel
class ProductListViewController: UIViewController {
    
    // MARK: - Properties
    
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
        
        self.title = "MVVM + Dependency Injection"
        
        let viewModel = ProductListViewModel(services: ProductsService(),
                                             delegate: myView)
        myView.viewModel = viewModel
    }
}

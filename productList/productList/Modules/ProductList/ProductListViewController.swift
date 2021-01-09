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
    
    var viewModel: ProductListViewModelProtocol?
    weak var coordinator: ProductListCoordinator?
    
    private var myView: ProductListView {
        // swiftlint:disable force_cast
        return view as! ProductListView
        // swiftlint:enable force_cast
    }

    /*
     This code inside if DEBUG will compile only in DEBUG mode, not for the release
     Since this convenience init is used only for unit test purposes
     Alternative: expose a factoryMethod to construct the viewController on AppDelegate
     */
    #if DEBUG
    // MARK: - Init
    
    // Inject the viewModel as well in order to test this viewController
    convenience init(viewModel vm: ProductListViewModelProtocol) {
        self.init(nibName: nil, bundle: nil)
        
        viewModel = vm
    }
    #endif
    
    // MARK: - Life Cycle

    override func loadView() {
        let myView = ProductListView()
        view = myView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "MVVM-Coordinator"

        // Inside SceneDelegate, this viewController is initialized without it's viewModel, so it is nil
        if viewModel == nil {
            viewModel = ProductListViewModel()
        }

        // After the ViewControllers init, when the ProductListView is constructed,
        // Only then set the viewModel's delegate
        viewModel?.delegate = myView
        myView.viewModel = viewModel
    }
    
}

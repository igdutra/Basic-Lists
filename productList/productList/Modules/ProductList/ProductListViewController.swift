//
//  ProductListViewController.swift
//  productList
//
//  Created by Ivo Dutra on 31/12/20.
//

import UIKit

protocol ProductListViewControllerDelegate: AnyObject {
    func reloadData()
}

/// ViewController is now only responsible for instanciating View and ViewModel
class ProductListViewController: UIViewController, HasCustomView {

    // MARK: - Typealias

    typealias CustomView = ProductListView

    // MARK: - Properties
    
    lazy var viewModel: ProductListViewModelProtocol? = ProductListViewModel(delegate: self)

    // MARK: - Life Cycle

    override func loadView() {
        super.loadView()
        let myView = ProductListView(tableViewDelegate: self, tableviewDatasource: self)
        view = myView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "MVVM Improvements?"
    }
}

// Header, Footer, willDisplay, didSelectRowAt..
extension ProductListViewController: UITableViewDelegate { }

extension ProductListViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let viewModel = viewModel else { return 0 }
        return viewModel.getCount()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let viewModel = viewModel,
              let productCell = tableView.dequeueReusableCell(cellClass: ProductListCell.self, indexPath: indexPath) else {
            return UITableViewCell()
        }

        // The old View necessity to now the ProductListCellViewModel was removed
        // All logic is created by the viewModel
        let product = viewModel.getProduct(at: indexPath.row)
        let cellViewModel = viewModel.createCellViewModel(from: product)
        productCell.viewModel = cellViewModel

        return productCell
    }

}

extension ProductListViewController: ProductListViewControllerDelegate {

    func reloadData() {
        customView.reloadTableViewData()
    }
}

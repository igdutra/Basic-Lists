//
//  ProductListView.swift
//  productList
//
//  Created by Ivo Dutra on 01/01/21.
//

import UIKit

/// ViewModel's Delegate is the View
protocol ProductListViewModelDelegate: AnyObject {
    func reloadData()
}

class ProductListView: UIView {
    
    // MARK: - Properties
    
    var viewModel: ProductListViewModelProtocol?
    private let cellId: String = "productListCell"
    
    // MARK: - UI Elements
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

    // MARK: - Delegate

extension ProductListView: ProductListViewModelDelegate {
  
    func reloadData() {
        tableView.reloadData()
    }
}

    // MARK: - Table View

// Header, Footer, willDisplay, didSelectRowAt..
extension ProductListView: UITableViewDelegate { }

extension ProductListView: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let viewModel = viewModel else { return 0 }
        // Here also the reference (dependency) to the Model was changed
        return viewModel.getCount()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let viewModel = viewModel else { return UITableViewCell() }
        
        guard let productCell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? ProductListCell else { return UITableViewCell() }

        // The old View necessity to now the ProductListCellViewModel was removed
        // All logic is created by the viewModel
        let product = viewModel.getProduct(at: indexPath.row)
        let cellViewModel = viewModel.createCellViewModel(from: product)
        productCell.viewModel = cellViewModel

        return productCell
    }

}

    // MARK: - Setups

extension ProductListView: ViewCodable {
    
    func configure() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ProductListCell.self, forCellReuseIdentifier: cellId)
    }
    
    func setupHierarchy() {
        self.addSubviews([tableView])
    }
    
    func setupConstraints() {
        tableView.edgesToSuperView()
    }
    
    func setupAcessibilityIdentifiers() {
        accessibilityIdentifier = AccessibilityIdentifiers.productListView.value
        tableView.accessibilityIdentifier = AccessibilityIdentifiers.tableView.value
    }
    
}

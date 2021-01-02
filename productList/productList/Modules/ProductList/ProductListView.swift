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
    
    var viewModel: ProductListViewModel?
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
        // TODO: search for other functions than reload data
        tableView.reloadData()
    }
}

    // MARK: - Table View

// Header, Footer, willDisplay, didSelectRowAt..
extension ProductListView: UITableViewDelegate { }

extension ProductListView: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let viewModel = viewModel else { return 0 }
        return viewModel.products.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let viewModel = viewModel else { return UITableViewCell() }
        
        guard let productCell = tableView.dequeueReusableCell(withIdentifier: cellId,
                                                              for: indexPath) as? ProductListCell else {  return UITableViewCell() }

        productCell.configureCell(with: viewModel.products[indexPath.row])

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
        // No UI Tests at the moment
    }
    
}

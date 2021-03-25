//
//  ProductListView.swift
//  productList
//
//  Created by Ivo Dutra on 01/01/21.
//

import UIKit

class ProductListView: UIView {

    // MARK: - UI Elements
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    // MARK: - Init

    init(tableViewDelegate: UITableViewDelegate, tableviewDatasource: UITableViewDataSource) {
        super.init(frame: .zero)

        tableView.delegate = tableViewDelegate
        tableView.dataSource = tableviewDatasource
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Public Methods

extension ProductListView {
  
    func reloadTableViewData() {
        tableView.reloadData()
    }
}

// MARK: - Setups

extension ProductListView: ViewCodable {
    
    func configure() {
        tableView.register(ProductListCell.self, forCellReuseIdentifier: String(describing: ProductListCell.self))
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

//
//  ProductListView.swift
//  productList
//
//  Created by Ivo Dutra on 01/01/21.
//

import UIKit

class ProductListView: UIView {
    
    // MARK: - Properties
    
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

    // MARK: - Setups

extension ProductListView: ViewCodable {
    
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

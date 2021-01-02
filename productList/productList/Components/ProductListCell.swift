//
//  ProductListCell.swift
//  productList
//
//  Created by Ivo Dutra on 02/01/21.
//

import UIKit

class ProductListCell: UITableViewCell {
    
    // MARK: - UI Elements
    
    // Obs: translatesAutoresizingMaskIntoConstraints = false was set in addSubviews
    
    private lazy var productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        return label
    }()

    private lazy var subTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = .darkGray
        return label
    }()

    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.textColor = .darkGray
        return label
    }()
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

    // MARK: - Setups

extension ProductListCell: ViewCodable {
    
    func setupHierarchy() {
        self.addSubviews([productImageView, titleLabel, subTitleLabel, priceLabel])
    }
    
    func setupConstraints() {
        
        productImageView
            .centerVerticalToSuperView()
            .leadingToSuperview(16)
            .widthTo(44)
            .heightTo(44)
            
        titleLabel
            .topToTop(of: productImageView)
            .leadingToTrailing(of: productImageView, margin: 8)
        
        subTitleLabel
            .bottomToBottom(of: productImageView)
            .leadingToTrailing(of: productImageView, margin: 8)
        
        priceLabel
            .centerVerticalToSuperView()
            .trailingToSuperview(16)
    }
    
    func setupAcessibilityIdentifiers() {
        // No UI Tests at the moment
    }
}

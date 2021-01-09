//
//  ProductListCell.swift
//  productList
//
//  Created by Ivo Dutra on 02/01/21.
//

import UIKit

class ProductListCell: UITableViewCell {
    
    // MARK: - Properties
    
    // When viewModel is set, configureCell will be called
    var viewModel: ProductListCellViewModelProtocol? {
        didSet {
            configureCell()
        }
    }
    
    // MARK: - UI Elements
    
    // Obs: translatesAutoresizingMaskIntoConstraints = false was set in addSubviews
    
    private lazy var productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        return label
    }()

    lazy var subTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = .darkGray
        return label
    }()

    lazy var priceLabel: UILabel = {
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
    
    // ConfigureCell uses now its ViewModel
    // Cell should not hold a reference to the Model
    func configureCell() {
        guard let viewModel = viewModel else { return }
        
        titleLabel.text = viewModel.name
        subTitleLabel.text = viewModel.description
        priceLabel.text = viewModel.price
        productImageView.from(url: viewModel.image)
        priceLabel.textColor = viewModel.discount ? .systemGreen : .gray
        
        // Indentifiers
        accessibilityIdentifier = viewModel.name
        titleLabel.accessibilityIdentifier = viewModel.name
        subTitleLabel.accessibilityIdentifier = viewModel.description
        priceLabel.accessibilityIdentifier = viewModel.price
        productImageView.accessibilityIdentifier = viewModel.name
    }
    
    func setupHierarchy() {
        self.addSubviews([productImageView, titleLabel, subTitleLabel, priceLabel])
    }
    
    func setupConstraints() {
        
        self.heightTo(60)
        
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
        // Done inside configureCell
    }
}

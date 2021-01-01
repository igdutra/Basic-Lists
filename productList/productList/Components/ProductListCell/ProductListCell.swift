//
//  ProductListCell.swift
//  productList
//
//  Created by Ivo Dutra on 01/01/21.
//

import UIKit.UITableViewCell

class ProductsListCell: UITableViewCell {
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var volumeLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    // MARK: - Set Up
    
    func setup(with product: Product) {
        titleLabel.text = product.product
        volumeLabel.text = product.description
        imgView.from(url: product.image)
        priceLabel.text = product.price.localized
        priceLabel.textColor = product.discount ? .systemGreen : .black
    }
    
}

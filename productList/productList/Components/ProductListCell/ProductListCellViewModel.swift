//
//  ProductListCellViewModel.swift
//  productList
//
//  Created by Ivo Dutra on 05/01/21.
//

import Foundation

protocol ProductListCellViewModelProtocol {
    var name: String { get set }
    var description: String { get set }
    var price: String { get set }
    var discount: Bool { get set }
    var image: String { get set }
    init(product: Product)
}

class ProductListCellViewModel: ProductListCellViewModelProtocol {

    // MARK: - Properties
    
    private var product: Product
    
    var name: String
    var description: String
    var price: String
    var discount: Bool
    var image: String
  
    // MARK: - Init
    
    required init(product: Product) {
        self.product = product
        
        self.name = product.name
        self.description = product.description
        self.price = product.price.localized
        self.discount = product.discount
        self.image = product.image
    }
    
}

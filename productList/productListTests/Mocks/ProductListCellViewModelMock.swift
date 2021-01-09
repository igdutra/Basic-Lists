//
//  ProductListCellViewModelMock.swift
//  productListTests
//
//  Created by Ivo Dutra on 05/01/21.
//

import Foundation
@testable import productList

/// Despite beeing almost exact as the original ProductListCellViewModel,
/// It was made because it is a good practice to isolate the test.
/// No dependecies
class ProductListCellViewModelMock: ProductListCellViewModelProtocol {
    
    var name: String
    
    var description: String
    
    var price: String
    
    var discount: Bool
    
    var image: String
    
    required init(product: Product) {
        self.name = product.name
        self.description = product.description
        self.price = product.price.localized
        self.discount = product.discount
        self.image = product.image
    }
    
}

//
//  ProducListViewMock.swift
//  productListTests
//
//  Created by Ivo Dutra on 02/01/21.
//

import XCTest
@testable import productList

/// Used to test the ViewModel
/// ViewModel calls reloadData() method only when result is success
class ProducListViewMock: ProductListViewModelProtocol {
  
    var wasReloadDataCalled = false 
    
    func reloadData() {
        wasReloadDataCalled = true
    }

    func getCount() -> Int {
        // TODO:
        return 0
    }

    func getProduct(at: Int) -> Product {
        return ProductMock().getProduct() ?? Product(name: "",
                                                     description: "",
                                                     price: 0,
                                                     discount: false,
                                                     image: "")
    }

    func createCellViewModel(from product: Product) -> ProductListCellViewModelProtocol {
        return ProductListCellViewModelMock(product: getProduct(at: 0))
    }
}

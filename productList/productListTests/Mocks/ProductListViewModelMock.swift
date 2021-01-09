//
//  ProductListViewModelMock.swift
//  productListTests
//
//  Created by Ivo Dutra on 07/01/21.
//

import XCTest
@testable import productList

/// Used to test the ViewController
/// ViewModel calls reloadData() method only when result is success
class ProductListViewModelMock: ProductListViewModelProtocol {

    weak var delegate: ProductListViewModelDelegate?

    func getCount() -> Int { 1 }

    func getProduct(at: Int) -> Product {
        // Protection against force unwrap
        if let product = ProductMock().getProduct() {
            return product
        } else {
            XCTFail("Could not load product")
            return ProductMock().getProduct()!
        } }

    func createCellViewModel(from product: Product) -> ProductListCellViewModel { ProductListCellViewModel(product: product)}

}


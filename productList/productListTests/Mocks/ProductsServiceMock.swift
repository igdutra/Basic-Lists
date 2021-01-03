//
//  ProductsServiceMock.swift
//  productListTests
//
//  Created by Ivo Dutra on 02/01/21.
//

import XCTest
@testable import productList

/// Used to test the ViewModel
/// ViewModel calls reloadData() method only when result is success
class ProductsServiceMock: ProductsServiceProtocol {
    
    var shouldProduceError = false
    
    enum MockError: Error {
        case getProduct
    }
    
    func getProducts(completion: @escaping (Result<[Product], Error>) -> Void) {
        
        guard let product = ProductMock().product else { return }
        let error = MockError.getProduct
 
        if !shouldProduceError {
            completion(.success([product]))
        } else {
            completion(.failure(error))
        }
        
    }
}

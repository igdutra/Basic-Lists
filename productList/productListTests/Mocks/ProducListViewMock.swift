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
class ProducListViewMock: ProductListViewModelDelegate {
  
    var wasReloadDataCalled = false 
    
    func reloadData() {
        wasReloadDataCalled = true
    }
}

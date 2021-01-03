//
//  ProductListViewModelTests.swift
//  productListTests
//
//  Created by Ivo Dutra on 02/01/21.
//

import XCTest
@testable import productList

class ProductListViewModelTests: XCTestCase {

    var sut: ProductListViewModel!
    var serviceMock: ProductsServiceMock!
    var listViewMock: ProducListViewMock!

    override func setUp() {
        super.setUp()
        
        serviceMock = ProductsServiceMock()
        listViewMock = ProducListViewMock()
        
        sut = ProductListViewModel(services: serviceMock,
                                   delegate: listViewMock)

    }

    override func tearDown() {
        sut = nil
        serviceMock = nil
        listViewMock = nil
        super.tearDown()
    }
    
    // MARK: - Get Products
    
    func testCaseSuccess() {
        // Get products is called on init from the viewModel
        XCTAssert(listViewMock.wasReloadDataCalled)
        XCTAssert(sut.products.count > 0)
    }
    
    func testCaseFailure() {
        // Products was populated in init
        sut.products = []
        serviceMock.shouldProduceError = true
        
        sut.getProducts()
        
        XCTAssertTrue(sut.products.isEmpty)
    }
    
}

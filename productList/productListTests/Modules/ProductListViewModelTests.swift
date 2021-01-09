//
//  ProductListViewModelTests.swift
//  productListTests
//
//  Created by Ivo Dutra on 02/01/21.
//

import XCTest
@testable import productList

class ProductListViewModelTests: XCTestCase {

    var sut: ProductListViewModel! // Sistem Under Test
    var serviceMock: ProductsServiceMock!
    var listViewMock: ProducListViewMock!

    override func setUp() {
        super.setUp()
        
        serviceMock = ProductsServiceMock()
        listViewMock = ProducListViewMock()
        
        sut = ProductListViewModel(services: serviceMock)
        sut.delegate = listViewMock
    }

    override func tearDown() {
        sut = nil
        serviceMock = nil
        listViewMock = nil
        super.tearDown()
    }
    
    // MARK: - Methods

    func testGetCount() {
        XCTAssertEqual(sut.getCount(), 1, "Product Mock produces exactly 1 Product")
    }
    
    func testGetProductsSuccess() {
        // Get products is called on init from the viewModel
        XCTAssert(listViewMock.wasReloadDataCalled)
        XCTAssertEqual(sut.getCount(), 1, "Product Mock produces exactly 1 Product")
    }

    func testGetProductAt() {
        guard let mock = ProductMock().getProduct() else { return XCTFail("Could not load mock") }

        XCTAssertEqual(sut.getProduct(at: 0).name, mock.name)
        XCTAssertEqual(sut.getProduct(at: 0).description, mock.description)
        XCTAssertEqual(sut.getProduct(at: 0).price, mock.price)
        XCTAssertEqual(sut.getProduct(at: 0).discount, mock.discount)
        XCTAssertEqual(sut.getProduct(at: 0).image, mock.image)
    }

    func testCreateViewModel() {
        guard let mock = ProductMock().getProduct() else { return XCTFail("Could not load mock") }
        let vm = sut.createCellViewModel(from: mock)
        XCTAssertNotNil(vm)
    }

}

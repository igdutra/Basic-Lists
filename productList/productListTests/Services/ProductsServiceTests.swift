//
//  ProductServicesTests.swift
//  productListTests
//
//  Created by Ivo Dutra on 02/01/21.
//

import XCTest
@testable import productList

class ProductsServiceTests: XCTestCase {

    var sut: ProductsService!

    override func setUp() {
        super.setUp()

        sut = ProductsService()
    }

    override func tearDown() {
        sut = nil

        super.tearDown()
    }

    // MARK: - Get Products

    func testGetProductsSuccess() {

        // Create an expectation for a background download task
        let expectation = XCTestExpectation(description: "Download products")

        sut.getProducts { (result) in
            switch result {
            case .success(let products):
                XCTAssertNotNil(products)
                expectation.fulfill()
            case .failure:
                XCTFail("Should return products")
            }
        }

        // Wait until the expectation is fulfilled, with a timeout of 5 seconds
        wait(for: [expectation], timeout: 5.0)
    }
    
    func testGetProductsFailure() {
        // Create an expectation for a background download task
        let expectation = XCTestExpectation(description: "Download products")
        
        sut.urlString = "https://example.com"

        sut.getProducts { (result) in
            switch result {
            case .success:
                XCTFail("Should not return success")
            case .failure(let error):
                XCTAssertNotNil(error)
                expectation.fulfill()
            }
        }

        // Wait until the expectation is fulfilled, with a timeout of 5 seconds
        wait(for: [expectation], timeout: 5.0)
    }

}

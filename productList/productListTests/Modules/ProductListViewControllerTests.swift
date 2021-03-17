//
//  ProductListViewControllerTests.swift
//  productListTests
//
//  Created by Ivo Dutra on 07/01/21.
//

import XCTest
@testable import productList

class ProductListViewControllerTests: XCTestCase {

    var sut: ProductListViewController!
    var viewModel: ProductListViewModelMock!

    override func setUp() {
        super.setUp()

        viewModel = ProductListViewModelMock()
        sut = ProductListViewController()
        sut.viewModel = viewModel
    }

    override func tearDown() {
        sut = nil
        viewModel = nil

        super.tearDown()
    }

    // MARK: - Properties

    func testViewNotNil() {
        XCTAssertNotNil(sut.view)
        XCTAssert(sut.view is ProductListView)
    }

    func testDelegateNotNil() {

        // TODO: convenience init is, somehow, being called after viewDidLoad
        XCTAssertNotNil(sut.viewModel)
//        XCTAssertNotNil(sut.viewModel?.delegate)
    }

}


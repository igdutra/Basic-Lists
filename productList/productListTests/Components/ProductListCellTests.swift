//
//  ProductListCellTests.swift
//  productListTests
//
//  Created by Ivo Dutra on 02/01/21.
//

import XCTest
@testable import productList

class ProductListCellTests: XCTestCase {

    var sut: ProductListCell!
    var productMock: Product!

    override func setUp() {
        super.setUp()
        sut = ProductListCell()

        // Preload view with mocked infos
        guard let product = ProductMock().product else { XCTFail("Could not load info"); return }
        productMock = product
        sut.configureCell(with: productMock)
    }

    override func tearDown() {
        sut = nil
        productMock = nil
        super.tearDown()
    }
    
    // MARK: - Labels
    
    // Obs: all labels were changed to public to make these tests
    // Maybe not the best approach

    func testTitleLabel() {
        XCTAssertEqual(sut.titleLabel.text, productMock.product)
    }

    func testSubTitleLabel() {
        XCTAssertEqual(sut.subTitleLabel.text, productMock.description)
    }

    func testIsDiscountTrue() {
        XCTAssertEqual(sut.priceLabel.textColor, UIColor.systemGreen)
    }

}

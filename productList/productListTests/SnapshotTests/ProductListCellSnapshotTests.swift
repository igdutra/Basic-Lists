//
//  ProductListCellSnapshotTests.swift
//  productListTests
//
//  Created by Renan Silveira on 16/03/21.
//

import XCTest
@testable import productList

class ProductListCellSnapshotTests: SnapshotTestCase {

    // MARK: - Private Properties

    private lazy var sut: ProductListCell = {
        let cell = ProductListCell(frame: CGRect(origin: .zero, size: CGSize(width: 414, height: 44)))
        if let mock = productMock {
            let cellViewModel = ProductListCellViewModelMock(product: mock)
            cell.viewModel = cellViewModel
        }
        return cell
    }()

    private var productMock: Product? = {
        guard let product = ProductMock().getProduct() else {
            XCTFail("Could not load info")
            return nil
        }

        return product
    }()

    // MARK: - Overrides

    override func setUp() {
        super.setUp()
        // Uncomment to record new snapshot reference
//        recordMode = true
    }
}

// MARK: - Test Cases

extension ProductListCellSnapshotTests {

    func testShouldAppear() {
        verifySnapshotView { () -> UIView? in
            self.sut
        }
    }
}

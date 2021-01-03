//
//  ProductServicesTests.swift
//  productListTests
//
//  Created by Ivo Dutra on 02/01/21.
//

import Foundation
@testable import productList

/// Mock a single product from a JSON file
class ProductMock {

    var product: Product?

    init() {
        product = decodeFromJSON()
    }

    func decodeFromJSON() -> Product? {

        var products: [Product]?
        var product: Product?

        if let path = Bundle.main.path(forResource: "singleProduct", ofType: "json") {
            var data: Data?

            do {
                data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            } catch {
                // Handle Error in a user friendly way
                print("Error while retrieving JSON info \n")
            }

            let jsonDecoder = JSONDecoder()

            if let data = data {
                products = try? jsonDecoder.decode([Product].self, from: data)
                // Only One
                product = products?[0]
            }
        }

        return product
    }

}

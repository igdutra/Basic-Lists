//
//  Product.swift
//  productList
//
//  Created by Ivo Dutra on 01/01/21.
//

import Foundation

struct Product: Codable {
    let product: String
    let description: String
    let price: Double
    let discount: Bool
    let image: String
    
    enum CodingKeys: String, CodingKey {
        case product = "produto"
        case description = "descricao"
        case price = "preco"
        case discount = "desconto"
        case image = "imagem"
    }
}

//
//  Product.swift
//  productList
//
//  Created by Ivo Dutra on 01/01/21.
//
import Foundation

// TODO: where should this be?

struct Product: Codable {
    let name: String
    let description: String
    let price: Double
    let discount: Bool
    let image: String
    
    enum CodingKeys: String, CodingKey {
        case name = "produto"
        case description = "descricao"
        case price = "preco"
        case discount = "desconto"
        case image = "imagem"
    }
}

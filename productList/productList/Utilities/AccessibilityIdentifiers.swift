//
//  AccessibilityIdentifiers.swift
//  productList
//
//  Created by Ivo Dutra on 02/01/21.
//

import Foundation

enum AccessibilityIdentifiers {
    // Product List View
    case productListView
    case tableView
    
    var value: String? {
        return String(describing: self)
    }
}

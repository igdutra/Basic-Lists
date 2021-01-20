//
//  UITableView+Extensions.swift
//  productList
//
//  Created by Renan Silveira on 20/01/21.
//

import UIKit

extension UITableView {

    func dequeueReusableCell<T>(cellClass: T.Type, indexPath: IndexPath) -> T? {
        return dequeueReusableCell(withIdentifier: String(describing: T.self), for: indexPath) as? T
    }

    func register<T: UITableViewCell>(cellClass: T.Type) {
        register(T.self, forCellReuseIdentifier: String(describing: T.self))
    }
}

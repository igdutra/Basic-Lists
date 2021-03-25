//
//  UITableView+Extensions.swift
//  productList
//
//  Created by Renan Silveira on 20/01/21.
//

import UIKit

extension UITableView {

    public func dequeueReusableCell<T>(cellClass: T.Type, indexPath: IndexPath) -> T? {
        return dequeueReusableCell(withIdentifier: String(describing: T.self), for: indexPath) as? T
    }
}

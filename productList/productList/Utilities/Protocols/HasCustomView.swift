//
//  HasCustomView.swift
//  productList
//
//  Created by Renan Silveira on 19/01/21.
//

import UIKit

protocol HasCustomView: AnyObject {
    associatedtype CustomView

    var customView: CustomView { get }
}

extension HasCustomView where Self: UIViewController {
    var customView: CustomView {
        guard let customView = view as? CustomView else {
            fatalError("Could not cast Custom View")
        }

        return customView
    }
}

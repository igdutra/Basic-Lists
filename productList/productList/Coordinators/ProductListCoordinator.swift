//
//  ProductListCoordinator.swift
//  productList
//
//  Created by Ivo Dutra on 09/01/21.
//

import UIKit

class ProductListCoordinator: NSObject, Coordinator {

    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let vc = ProductListViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
}

//
//  Coordinator.swift
//  productList
//
//  Created by Ivo Dutra on 09/01/21.
//

import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }

    func start()
}

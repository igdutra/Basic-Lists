//
//  ProductListViewController.swift
//  productList
//
//  Created by Ivo Dutra on 31/12/20.
//

import UIKit

class ProductListViewController: UIViewController {
    
    // MARK: - Properties
    
    private var products: [String] = ["placeholder"]
    
    private var myView: ProductListView {
        // swiftlint:disable force_cast
        return view as! ProductListView
        // swiftlint:enable force_cast
    }
    
    // MARK: - Life Cycle

    override func loadView() {
        let myView = ProductListView()
        self.view = myView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "MVC + ViewCode"
       
        myView.tableView.delegate = self
        myView.tableView.dataSource = self
    }
    
}

    // MARK: - Table View

// Header, Footer, willDisplay, didSelectRowAt..
extension ProductListViewController: UITableViewDelegate { }

extension ProductListViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        products.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell()
    }

}

//
//  ProductListViewController.swift
//  productList
//
//  Created by Ivo Dutra on 31/12/20.
//

import UIKit

class ProductListViewController: UIViewController {
    
    // Remember to set, in xib file, the "view" Outlet to the "View" (your main view)
    // And the Custom Class to this ViewController
    @IBOutlet weak var tableView: UITableView!
    private var products: [Product] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "List - Xib"
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        let service = ProductsService()
        service.getProducts { [weak self] (result) in
            guard let self = self else { return }
            // TODO: Bonus: activity indicator
            switch result {
            case .success(let products):
                self.products = products
                self.tableView.reloadData() // TODO: search for other functions than reload data
            case .failure:
                print("No Products were returned")
            }
            print(self.products)
        }
    }

}

// MARK: - TableView

extension ProductListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell()
    }

}

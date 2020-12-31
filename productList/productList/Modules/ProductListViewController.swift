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
    private var products: [String] = ["placeholder"]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "List - Xib"
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
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

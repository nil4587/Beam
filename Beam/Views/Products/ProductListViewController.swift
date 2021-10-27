//
//  ProductListViewController.swift
//  Beam
//
//  Created by Nileshkumar Mukeshbhai Prajapati on 2021/10/23.
//

import Foundation
import UIKit

class ProductListViewController: BaseViewController {
    
    private lazy var viewModel = ProductListViewModel(delegate: self)

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var scanView: UIView!

    var tabbarController: TabBarViewController? {
        return (self.parent?.parent) as? TabBarViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scanView.addGestureRecognizer(viewModel.tapGuesture)
        self.tableView.tableFooterView = UIView()
        self.tableView.dataSource = viewModel.tableViewDataSource
        self.tableView.delegate = viewModel.tableViewDelegate
        self.tableView.reloadData()
        tabbarController?.tabBar.isHidden = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        let productDetailsViewController = segue.destination as? ProductDetailsViewController
        productDetailsViewController?.setParent(category: .products)
    }
}

// MARK: - ================================
// MARK: ProductListView Delegate Methods
// MARK: ================================

extension ProductListViewController: ProductListViewDelegate {
    func refreshList() {
        self.tableView.reloadData()
        scanView.isHidden = viewModel.numberOfItems > 0
        tabbarController?.tabBar.isHidden = false
    }
    
    func scanButtonTapped() {
        let tabBarController = (self.parent?.parent) as? TabBarViewController
        tabBarController?.selectedIndex = 1
    }
    
    func selectedRow(at indexPath: IndexPath) {
        self.performSegue(withIdentifier: "ProductDetailsSegue", sender: nil)
    }
}

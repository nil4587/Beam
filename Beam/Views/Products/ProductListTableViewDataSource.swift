//
//  ProductListTableViewDataSource.swift
//  Beam
//
//  Created by Nileshkumar Mukeshbhai Prajapati on 2021/10/27.
//

import UIKit

class ProductListTableViewDataSource: NSObject, UITableViewDataSource {
      
    var viewModels: [ProductModelViewModel]
    private let reuseIdentifier: String
    
    init(viewModels: [ProductModelViewModel],
         reuseIdentifier: String) {
        self.viewModels = viewModels
        self.reuseIdentifier = reuseIdentifier
    }
    
    // MARK: - ================================
    // MARK: UITableView DataSource Methods
    // MARK: ================================
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count > 0 ? viewModels.count : 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "CellIdentifier"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellIdentifier)
        }
        cell?.textLabel?.font = UIFont(name: "Poppins-Regular", size: 16.0)
        if viewModels.count > 0 {
            cell?.textLabel?.text = viewModels[indexPath.row].title
            cell?.imageView?.image = viewModels[indexPath.row].icon
            cell?.accessoryView = UIImageView(image: #imageLiteral(resourceName: "kisspng-canon-eos-logo-printer"))
        } else {
            cell?.selectionStyle = .none
            cell?.textLabel?.text = "zero_products".localized()
        }
        return cell!
    }
}

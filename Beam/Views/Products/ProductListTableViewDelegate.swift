//
//  ProductListTableViewDelegate.swift
//  Beam
//
//  Created by Nileshkumar Mukeshbhai Prajapati on 2021/10/27.
//

import UIKit

class ProductListTableViewDelegate: NSObject, UITableViewDelegate {

    typealias TableRawSelection = (ProductModelViewModel, IndexPath) -> Void
    
    private let tableRawSelection: TableRawSelection

    var viewModels: [ProductModelViewModel]
    
    init(viewModels: [ProductModelViewModel],
         tableRawSelection: @escaping TableRawSelection) {
        self.viewModels = viewModels
        self.tableRawSelection = tableRawSelection
    }
    
    // MARK: - ================================
    // MARK: UITableView Delegate Methods
    // MARK: ================================
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let myLabel = UILabel()
        myLabel.frame = CGRect(x: 15.0, y: 0.0, width: tableView.width - 15.0, height: 36.0)
        myLabel.font = UIFont(name: "Poppins-Regular", size: 24.0)
        myLabel.text = "products_title".localized()
        let headerView = UIView()
        headerView.backgroundColor = UIColor.systemBackground
        headerView.addSubview(myLabel)
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard viewModels.count > 0 else {
            return
        }
        tableView.deselectRow(at: indexPath, animated: true)
        tableRawSelection(viewModels[indexPath.row], indexPath)
    }
}

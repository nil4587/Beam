//
//  ProductListViewModel.swift
//  Beam
//
//  Created by Nileshkumar Mukeshbhai Prajapati on 2021/10/23.
//

import Foundation
import UIKit

protocol ProductListViewDelegate: NSObjectProtocol {
    func refreshList()
    func scanButtonTapped()
    func selectedRow(at indexPath: IndexPath)
}

class ProductListViewModel {
    
    private weak var delegate: ProductListViewDelegate?
    var productsList = [ProductModel]()
    private(set) var tableViewDelegate: ProductListTableViewDelegate!
    private(set) lazy var tableViewDataSource = ProductListTableViewDataSource(viewModels: self.productModelViewModelList,
                                                                               reuseIdentifier: "CellIdentifier")
    init(delegate: ProductListViewDelegate?) {
        self.delegate = delegate
        NotificationCenter.default.addObserver(self, selector: #selector(self.scanningCompletedAndComfirmed(_:)), name: Notification.Name("ScanningCompletedAndComfirmed"), object: nil)
        tableViewDelegate = ProductListTableViewDelegate(viewModels: self.productModelViewModelList,
                                                         tableRawSelection: { (modelViewModel, indexPath) in
                                                            delegate?.selectedRow(at: indexPath)
                                                         })
    }
    
    var numberOfItems: Int {
        return productsList.count
    }
    
    var productModelViewModelList: [ProductModelViewModel] {
        return productsList.map({ProductModelViewModel(product: $0)})
    }
    
    var tapGuesture: UITapGestureRecognizer {
        let tapGuesture = UITapGestureRecognizer(target: self, action: #selector(self.scanButtonTapped(_:)))
        tapGuesture.numberOfTapsRequired = 1
        tapGuesture.numberOfTouchesRequired = 1
        return tapGuesture
    }
    
    @objc func scanButtonTapped(_ recognizer: UITapGestureRecognizer) {
        delegate?.scanButtonTapped()
    }
    
    @objc func scanningCompletedAndComfirmed(_ notification: Notification) {
        var product = ProductModel()
        product.title = "EF 50mm f/1.8 STM Lens"
        product.icon = #imageLiteral(resourceName: "canon_lens")
        product.logo = #imageLiteral(resourceName: "kisspng-canon-eos-logo-printer")
        productsList.append(product)
        tableViewDataSource .viewModels = self.productModelViewModelList
        tableViewDelegate .viewModels = self.productModelViewModelList
        delegate?.refreshList()
    }
    
    func productTitle(at index: Int) -> String? {
        return productsList[index].title
    }
    
    func productIcon(at index: Int) -> UIImage? {
        return productsList[index].icon
    }
    
    func productLogo(at index: Int) -> UIImage? {
        return productsList[index].logo
    }
}

//
//  ProductModelViewModel.swift
//  Beam
//
//  Created by Nileshkumar Mukeshbhai Prajapati on 2021/10/27.
//

import UIKit

struct ProductModelViewModel {
    
    private var product: ProductModel
    
    init(product: ProductModel) {
        self.product = product
    }
    
    var title: String? {
        return product.title
    }
    
    var icon: UIImage? {
        return product.icon
    }
    
    var logo: UIImage? {
        return product.logo
    }
}

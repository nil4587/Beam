//
//  ProductDetailsViewModel.swift
//  Beam
//
//  Created by Nileshkumar Mukeshbhai Prajapati on 2021/10/23.
//

import Foundation

struct ProductDetailsViewModel {
    
    private(set) var parentCategory: ScanDetailsParentCategory = .products
    
    mutating func setParent(category: ScanDetailsParentCategory) {
        parentCategory = category
    }
}

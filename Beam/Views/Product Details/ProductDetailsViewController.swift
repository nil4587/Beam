//
//  ProductDetailsViewController.swift
//  Beam
//
//  Created by Nileshkumar Mukeshbhai Prajapati on 2021/10/23.
//

import UIKit

class ProductDetailsViewController: UIViewController {

    @IBOutlet private weak var buttonStackView: UIStackView!
    @IBOutlet private weak var rescanButton: UIButton!
    @IBOutlet private weak var confirmButton: UIButton!

    private var viewModel = ProductDetailsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if viewModel.parentCategory == .scan {
            self.navigationItem.setHidesBackButton(true, animated: false)
        } else {
            buttonStackView.removeFromSuperview()
        }
    }
    
    func setParent(category: ScanDetailsParentCategory) {
        viewModel.setParent(category: category)
    }
    
    @IBAction private func buttonTapped(_ sender: UIButton) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            if sender == self.confirmButton {
                NotificationCenter.default.post(name: Notification.Name("ScanningCompletedAndComfirmed"), object: nil)
                
                let tabBarController = (self.parent?.parent) as? TabBarViewController
                tabBarController?.selectedIndex = 0
            }
            self.navigationController?.popViewController(animated: true)
        }
    }
}

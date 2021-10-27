//
//  ScanViewController.swift
//  Beam
//
//  Created by Nileshkumar Mukeshbhai Prajapati on 2021/10/26.
//

import UIKit
import BarcodeScanner

class ScanViewController: BarcodeScannerViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.codeDelegate = self
        self.errorDelegate = self
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
          return .lightContent
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        let productDetailsViewController = segue.destination as? ProductDetailsViewController
        productDetailsViewController?.setParent(category: .scan)
        productDetailsViewController?.hidesBottomBarWhenPushed = true
    }
}

// MARK: - ================================
// MARK: Barcode Scanner Code Delegate Methods
// MARK: ================================

extension ScanViewController: BarcodeScannerCodeDelegate {
    func scanner(_ controller: BarcodeScannerViewController, didCaptureCode code: String, type: String) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
            self.performSegue(withIdentifier: "FromScanToProductDetailsSegue", sender: nil)
            controller.resetWithError()
        }
    }
}

// MARK: - ================================
// MARK: Barcode Scanner Error Delegate Methods
// MARK: ================================

extension ScanViewController: BarcodeScannerErrorDelegate {
    func scanner(_ controller: BarcodeScannerViewController, didReceiveError error: Error) {
        
    }
}

//
//  UI+Localize.swift
//  Beam
//
//  Created by Nileshkumar Mukeshbhai Prajapati on 2021/10/26.
//

import Foundation
import UIKit

// MARK: - ================================
// MARK: UILabel localize Key extention for language in story board
// MARK: ================================

extension UILabel {
    @IBInspectable var localizedTextKey: String? {
        set {
            // set new value from dictionary
            DispatchQueue.main.async {
                self.text = newValue?.localized()
            }
        }
        get {
            return self.text
        }
    }
}

// MARK: - ================================
// MARK: UIButton localize Key extention for language in story board
// MARK: ================================

extension UIButton {

    @IBInspectable var localizedTitleKey: String? {
        set {
            // set new value from dictionary
            DispatchQueue.main.async {
                self.setTitle(newValue?.localized(), for: .normal)
            }
        }
        get {
            return self.titleLabel?.text
        }
    }
}

// MARK: - ================================
// MARK: UITextView localize Key extention for language in story board
// MARK: ================================

extension UITextView {

    @IBInspectable var localizedTextKey: String? {
        set {
            // set new value from dictionary
            DispatchQueue.main.async {
                self.text = newValue?.localized()
            }
        }
        get {
            return self.text
        }
    }
}

// MARK: - ================================
// MARK: UITextField localize Key extention for language in story board
// MARK: ================================

extension UITextField {
    @IBInspectable var localizedTextKey: String? {
        set {
            // set new value from dictionary
            DispatchQueue.main.async {
                self.text = newValue?.localized()
            }
        }
        get {
            return self.text
        }
    }
}

// MARK: - ================================
// MARK: UITextField localize Key extention for language in story board
// MARK: ================================

extension UITabBarItem {
    @IBInspectable var localizedTitleKey: String? {
        set {
            // set new value from dictionary
            DispatchQueue.main.async {
                self.title = newValue?.localized()
            }
        }
        get {
            return self.title
        }
    }
}

// MARK: - ================================
// MARK: UINavigationItem localize Key extention for language in story board
// MARK: ================================

extension UINavigationItem {

    @IBInspectable var localizedKey: String? {
        set {
            // set new value from dictionary
            DispatchQueue.main.async {
                self.title = newValue?.localized()
            }
        }
        get {
            return self.title
        }
    }
}

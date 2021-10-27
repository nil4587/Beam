//
//  Extensions.swift
//  Beam
//
//  Created by Nileshkumar Mukeshbhai Prajapati on 2021/10/24.
//

import Foundation
import UIKit

// MARK: - ================================
// MARK: UINavigationBar
// MARK: ================================

extension UINavigationBar {
    
    static func changeNavigationBarUI() {
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        UIBarButtonItem.appearance().setBackButtonTitlePositionAdjustment(UIOffset(horizontal: -100.0, vertical: 0.0), for: .default)
    }
}

// MARK: - ================================
// MARK: String
// MARK: ================================

extension String {
    var trimmedString: String { return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines) }
    
    var length: Int { return self.count }
    
    /**
     To map the string with localised synonym.
     */
    func localized() -> String {
        return NSLocalizedString(self, comment: "")
    }
}

// MARK: - ================================
// MARK: UIView
// MARK: ================================

extension UIView {
    
    var width: CGFloat { get { return self.frame.size.width } set { self.frame.size.width = newValue } }
    var height: CGFloat { get { return self.frame.size.height } set { self.frame.size.height = newValue } }
    var size: CGSize { get { return self.frame.size } set { self.frame.size = newValue } }
    
    var origin: CGPoint { get { return self.frame.origin } set { self.frame.origin = newValue } }
    var x: CGFloat { get { return self.frame.origin.x } set { self.frame.origin.x = newValue } }
    var y: CGFloat { get { return self.frame.origin.y } set { self.frame.origin.y = newValue } }
    var centerX: CGFloat { get { return self.center.x } set { self.center.x = newValue } }
    var centerY: CGFloat { get { return self.center.y } set { self.center.y = newValue } }

    var isPortrait: Bool { return width < height }
    var isLandscape: Bool { return width > height }
    
    // To set border color directly through storyboard or .XIB
    @IBInspectable var borderColor: UIColor? {
        get {
            return layer.borderColor.map { UIColor(cgColor: $0) }
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
    
    // To set border width directly through storyboard or .XIB
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    // To set corner radius directly through storyboard or .XIB
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
}

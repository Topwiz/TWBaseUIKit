//
//  Commen+Extensions.swift
//  Pods-TWBaseUIKit_Example
//
//  Created by Jeehoon Son on 2021/05/28.
//

import Foundation

//MARK: - UIStatusBarStyle
extension UIStatusBarStyle {
    static var black: UIStatusBarStyle {
        if #available(iOS 13.0, *) {
            return .darkContent
        }
        return .default
    }
    static var white: UIStatusBarStyle {
        return .lightContent
    }
}

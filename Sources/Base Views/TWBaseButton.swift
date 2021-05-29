//
//  TWBaseButton.swift
//  Pods-TWBaseUIKit_Example
//
//  Created by Jeehoon Son on 2021/05/29.
//

import Foundation
import UIKit

open class TWBaseButton: UIButton {
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        manager.logging(type(of: self), type: .viewInit)
        
        addSubviews.forEach({ addSubview($0) })
        setup()
        setLayout()
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        manager.logging(type(of: self), type: .viewInit)
    }
    
    deinit {
        manager.logging(type(of: self), type: .viewDeInit)
    }
    
    //MARK: - Set UI
    open var addSubviews: [UIView] {
        return []
    }
    
    open func setup() {
        translatesAutoresizingMaskIntoConstraints = manager.option.defaultTranslatesAutoresizingMaskIntoConstraints
        imageView?.contentMode = manager.option.defaultImageContentMode
        setTitleColor(manager.option.defaultLabelColor, for: .normal)
        titleLabel?.font = manager.option.defaultFont
    }
    
    open func setLayout() {
        
    }
}

 


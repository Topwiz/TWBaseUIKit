//
//  TWBaseTextField.swift
//  Pods-TWBaseUIKit_Example
//
//  Created by Jeehoon Son on 2021/05/29.
//

import Foundation
import UIKit

open class TWBaseTextField: UITextField {
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        initial()
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        initial()
    }
    
    deinit {
        manager.logging(type(of: self), type: .extViewDeInit)
    }
    
    private func initial() {
        manager.logging(type(of: self), type: .extViewInit)
        
        addSubviews.forEach({ addSubview($0) })
        setup()
        setLayout()
    }
    
    //MARK: - Set UI
    open var addSubviews: [UIView] {
        return []
    }
    
    open func setup() {
        backgroundColor = manager.option.defaultViewBackgroundColor
        translatesAutoresizingMaskIntoConstraints = manager.option.defaultTranslatesAutoresizingMaskIntoConstraints
        font = manager.option.defaultFont
        textColor = manager.option.defaultLabelColor
    }
    
    open func setLayout() {
        
    }
    
}

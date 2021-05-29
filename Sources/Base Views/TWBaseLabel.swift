//
//  TWBaseLabel.swift
//  Pods-TWBaseUIKit_Example
//
//  Created by Jeehoon Son on 2021/05/29.
//

import Foundation

open class TWBaseLabel: UILabel {
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        manager.logging(type(of: self), type: .extViewInit)
        
        addSubviews.forEach({ addSubview($0) })
        setup()
        setLayout()
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        manager.logging(type(of: self), type: .extViewInit)
    }
    
    deinit {
        manager.logging(type(of: self), type: .extViewDeInit)
    }
    
    //MARK: - Set UI
    open var addSubviews: [UIView] {
        return []
    }
    
    open func setup() {
        translatesAutoresizingMaskIntoConstraints = manager.option.defaultTranslatesAutoresizingMaskIntoConstraints
        textColor = manager.option.defaultLabelColor
        font = manager.option.defaultFont
    }
    
    open func setLayout() {
        
    }
}

 


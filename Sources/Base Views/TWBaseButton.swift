//
//  TWBaseButton.swift
//  Pods-TWBaseUIKit_Example
//
//  Created by Jeehoon Son on 2021/05/29.
//

import Foundation
import UIKit

open class TWBaseButton: UIButton {
    
    public init(title: String = "") {
        super.init(frame: .zero)
        setTitle(title, for: .normal)
        initial()
    }
    
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
    
    public var tapped: (()->())?
    
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
        translatesAutoresizingMaskIntoConstraints = manager.option.defaultTranslatesAutoresizingMaskIntoConstraints
        imageView?.contentMode = manager.option.defaultImageContentMode
        setTitleColor(manager.option.defaultLabelColor, for: .normal)
        titleLabel?.font = manager.option.defaultFont
        
        addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
    }
    
    open func setLayout() {
        
    }
    
    @objc private func buttonTapped(_ sender: UIButton) {
        tapped?()
    }
}

 


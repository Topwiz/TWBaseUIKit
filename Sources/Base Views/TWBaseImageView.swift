//
//  TWBaseImageView.swift
//  Pods
//
//  Created by Jeehoon Son on 2021/05/29.
//

import Foundation

open class TWBaseImageView: UIImageView {
    
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
        translatesAutoresizingMaskIntoConstraints = manager.option.defaultTranslatesAutoresizingMaskIntoConstraints
        contentMode = manager.option.defaultImageContentMode
    }
    
    open func setLayout() {
        
    }
    
}

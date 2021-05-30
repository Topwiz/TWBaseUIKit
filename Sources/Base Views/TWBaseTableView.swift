//
//  TWBaseTableView.swift
//  Pods
//
//  Created by Jeehoon Son on 2021/05/29.
//

import Foundation

class TWBaseTableView: UITableView {
    
    public override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
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
    }
    
    open func setLayout() {
        
    }
    
}

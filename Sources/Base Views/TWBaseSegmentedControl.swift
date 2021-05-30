//
//  TWBaseSegment.swift
//  Pods
//
//  Created by Jeehoon Son on 2021/05/30.
//

import Foundation

open class TWBaseSegmentedControl: UISegmentedControl {
    
    public var tapped: ((Int) -> ())?
    
    public init(titleArray: [String] = []) {
        super.init(frame: .zero)
        titleArray.enumerated().forEach({
            setTitle($0.element, forSegmentAt: $0.offset)
        })
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
        manager.logging(type(of: self), type: .extViewInit)
    }
    
    private func initial() {
        manager.logging(type(of: self), type: .extViewDeInit)
        
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
        addTarget(self, action: #selector(valueChanged(_:)), for: .valueChanged)
    }
    
    open func setLayout() {
        
    }
    
    @objc private func valueChanged(_ sender: UISegmentedControl) {
        tapped?(sender.selectedSegmentIndex)
    }
    
}

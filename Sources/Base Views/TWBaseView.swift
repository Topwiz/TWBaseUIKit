//
//  TWBaseView.swift
//  Pods-TWBaseUIKit_Example
//
//  Created by Jeehoon Son on 2021/05/29.
//

import Foundation
import UIKit

open class TWBaseView: UIView {
    
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
        if manager.option.removeObserverWhenDeInit {
            NotificationCenter.default.removeObserver(self)
        }
        manager.logging(type(of: self), type: .viewDeInit)
    }
    
    //MARK: - Set UI
    open var addSubviews: [UIView] {
        return []
    }
    
    open func setup() {
        backgroundColor = manager.option.defaultBackgroundColor
        translatesAutoresizingMaskIntoConstraints = manager.option.defaultTranslatesAutoresizingMaskIntoConstraints
    }
    
    open func setLayout() {
        
    }
}

 

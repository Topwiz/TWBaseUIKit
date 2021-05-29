//
//  CustomView.swift
//  TWBaseUIKit_Example
//
//  Created by Jeehoon Son on 2021/05/29.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation
import TWBaseUIKit

class CustomView: TWBaseView {
    
    lazy var view: TWBaseView = {
        let view = TWBaseView()
        view.backgroundColor = .red
        return view
    }()
    
    override var addSubviews: [UIView] {
        return [view]
    }
    
    override func setup() {
        super.setup()
        
        backgroundColor = .lightGray
    }
    
    override func setLayout() {
        super.setLayout()
        
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: topAnchor),
            view.leadingAnchor.constraint(equalTo: leadingAnchor),
            view.trailingAnchor.constraint(equalTo: trailingAnchor),
            view.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5)
        ])
    }
    
}

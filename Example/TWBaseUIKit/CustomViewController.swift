//
//  ViewController.swift
//  TWBaseUIKit
//
//  Created by Topwiz on 05/28/2021.
//  Copyright (c) 2021 Topwiz. All rights reserved.
//

import TWBaseUIKit

class CustomViewController: TWBaseViewController {
    
    lazy var customView = CustomView()
    
    override var addSubviews: [UIView] {
        return [customView]
    }
    
    override func setup() {
        super.setup()
        
        
    }
    
    override func setLayout() {
        super.setLayout()
        
        NSLayoutConstraint.activate([
            customView.topAnchor.constraint(equalTo: view.topAnchor),
            customView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            customView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            customView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7)
        ])
    }
    
}

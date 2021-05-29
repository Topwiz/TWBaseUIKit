//
//  ViewController.swift
//  TWBaseUIKit
//
//  Created by Topwiz on 05/28/2021.
//  Copyright (c) 2021 Topwiz. All rights reserved.
//

import TWBaseUIKit

class CustomViewController: TWBaseViewController {
    
    let customView = CustomView()
    let customButton = CustomButton()
    let customLabel = CustomLabel()
    let customTextField = CustomTextField()
    
    override var addSubviews: [UIView] {
        return [customView, customButton,
                customLabel, customTextField]
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
            customView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7),
            
            customButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 16),
            customButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            customLabel.topAnchor.constraint(equalTo: customButton.bottomAnchor),
            customLabel.leadingAnchor.constraint(equalTo: customButton.leadingAnchor),
            
            customTextField.topAnchor.constraint(equalTo: customLabel.bottomAnchor, constant: 8),
            customTextField.leadingAnchor.constraint(equalTo: customButton.leadingAnchor),
            customTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }
    
}

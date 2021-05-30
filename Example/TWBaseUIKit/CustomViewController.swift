//
//  ViewController.swift
//  TWBaseUIKit
//
//  Created by Topwiz on 05/28/2021.
//  Copyright (c) 2021 Topwiz. All rights reserved.
//

import TWBaseUIKit

class CustomViewController: TWBaseViewController {
    
    let customView = CustomView(enableTap: true)
    let customButton = CustomButton(title: "Custom Button")
    let customLabel = CustomLabel()
    let customTextField = CustomTextField()
    let customTextView = CustomTextView()
    
    override var addSubviews: [UIView] {
        return [customView, customButton,
                customLabel, customTextField,
                customTextView]
    }
    
    override func setup() {
        super.setup()
        customButton.tapped = {
            print("customButtonTapped")
        }
        
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
            customTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            customTextView.topAnchor.constraint(equalTo: customTextField.bottomAnchor, constant: 8),
            customTextView.leadingAnchor.constraint(equalTo: customTextField.leadingAnchor),
            customTextView.trailingAnchor.constraint(equalTo: customTextField.trailingAnchor),
            customTextView.heightAnchor.constraint(equalToConstant: 50),
            
        ])
    }
    
}

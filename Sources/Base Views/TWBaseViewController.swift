//
//  TWBaseViewController.swift
//  Pods-TWBaseUIKit_Example
//
//  Created by Jeehoon Son on 2021/05/28.
//

import Foundation
import UIKit

open class TWBaseViewController: UIViewController {
    
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        manager.logging(type(of: self), type: .viewInit)
        initial()
    }
    
    deinit {
        if manager.option.removeObserverWhenDeInit {
            NotificationCenter.default.removeObserver(self)
        }
        manager.logging(type(of: self), type: .viewDeInit)
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        manager.logging(type(of: self), type: .viewInit)
        initial()
    }
    
    open var statusBarColor: UIStatusBarStyle {
        return manager.option.defaultStatusBarColor
    }
    
    open override var preferredStatusBarStyle: UIStatusBarStyle {
        statusBarColor
    }
    
    //MARK: - View Life Cycle
    open override func viewDidLoad() {
        super.viewDidLoad()
        manager.logging(type(of: self), type: .viewDidLoad)
        setUI()
    }
    
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        manager.logging(type(of: self), type: .viewWillAppear)
    }
    
    open override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        manager.logging(type(of: self), type: .viewDidAppear)
    }
    
    open override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        manager.logging(type(of: self), type: .viewWillDisappear)
    }
    
    open override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        manager.logging(type(of: self), type: .viewDidDisappear)
    }
    
    //MARK: - Initial
    open func initial() {
        
    }
    
    //MARK: - Set UI
    open func setUI() {
        view.backgroundColor = manager.option.defaultBackgroundColor
    }
}

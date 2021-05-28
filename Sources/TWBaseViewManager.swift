//
//  TWBaseViewManager.swift
//  Pods-TWBaseUIKit_Example
//
//  Created by Jeehoon Son on 2021/05/28.
//

import Foundation

let manager = TWBaseViewManager.shared

public class TWBaseViewManager {
    static var shared = TWBaseViewManager()
    
    public struct Option {
        // Common
        public var logging = true
        public var loggingLevel: LoggingLevel = .medium
        public var defaultBackgroundColor: UIColor = .white
        public var defaultStatusBarColor: UIStatusBarStyle = .black
        
        
        // TWBaseViewController
        public var removeObserverWhenDeInit = true
    }
    
    public var option = Option()
    
    //MARK: - Logging
    public enum LoggingLevel: Int {
        /// Low : Only `init` and `deinit` logging
        case low
        /// Medium : `init`, `deinit`, `LifeCycle` logging
        case medium
        case high
        
        var loggingTypes: [LoggingType] {
            switch self {
            case .low:
                return [.viewInit, .viewDeInit]
            case .medium, .high:
                return [.viewInit, .viewDeInit,
                        .viewDidLoad, .viewWillAppear,
                        .viewDidAppear, .viewWillDisappear,
                        .viewDidDisappear]
            }
        }
    }
    
    internal enum LoggingType: String {
        case viewInit = "init"
        case viewDeInit = "deinit"
        case viewDidLoad
        case viewWillAppear
        case viewDidAppear
        case viewWillDisappear
        case viewDidDisappear
    }
    
    internal func logging(_ anyClass: AnyClass, type: LoggingType) {
        if !manager.option.logging { return }
        
        if manager.option.loggingLevel.loggingTypes.contains(type) {
            print("TWBaseUIKit :: \(NSStringFromClass(anyClass)) - \(type.rawValue)")
        }
    }
}

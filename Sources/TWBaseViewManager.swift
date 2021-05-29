//
//  TWBaseViewManager.swift
//  Pods-TWBaseUIKit_Example
//
//  Created by Jeehoon Son on 2021/05/28.
//

import Foundation

let manager = TWBaseViewManager.shared

public class TWBaseViewManager {
    public static var shared = TWBaseViewManager()
    
    public struct Option {
        // Common
        public var logging = true
        public var loggingLevel: LoggingLevel = .high
        public var defaultViewBackgroundColor: UIColor = .white
        public var defaultStatusBarColor: UIStatusBarStyle = .black
        
        // TWBaseView
        public var removeObserverWhenDeInit = true
        public var defaultTranslatesAutoresizingMaskIntoConstraints = false
        
        // Font
        public var defaultFont: UIFont = UIFont.systemFont(ofSize: 14)
        public var defaultLabelColor: UIColor = .black
        
        // Image
        public var defaultImageContentMode: UIView.ContentMode = .scaleAspectFit
    }

    public var option = Option()
    
    //MARK: - Logging
    public enum LoggingLevel: Int {
        /// Only UIView, UIViewController` init` and `deinit` logging
        case low
        /// UIView, UIViewController `init`, `deinit`, `View Controller LifeCycle` logging
        case medium
        /// All view `init`, `deinit`, `LifeCycle` logging
        case high
        
        var loggingTypes: [LoggingType] {
            switch self {
            case .low:
                return [.viewInit, .viewDeInit]
            case .medium:
                return [.viewInit, .viewDeInit,
                        .viewDidLoad, .viewWillAppear,
                        .viewDidAppear, .viewWillDisappear,
                        .viewDidDisappear]
            case .high:
                return [.viewInit, .viewDeInit, .extViewInit, .extViewDeInit,
                        .viewDidLoad, .viewWillAppear,
                        .viewDidAppear, .viewWillDisappear,
                        .viewDidDisappear]
            }
        }
    }
    
    internal enum LoggingType: String {
        case viewInit
        case viewDeInit
        case extViewInit
        case extViewDeInit
        case viewDidLoad
        case viewWillAppear
        case viewDidAppear
        case viewWillDisappear
        case viewDidDisappear
        
        var description: String {
            switch self {
            case .viewInit, .extViewInit: return "init"
            case .viewDeInit, .extViewDeInit: return "deinit"
            default: return self.rawValue
            }
        }
    }
    
    internal func logging(_ anyClass: AnyClass, type: LoggingType) {
        if !manager.option.logging { return }
        
        if manager.option.loggingLevel.loggingTypes.contains(type) {
            print("TWBaseUIKit :: \(NSStringFromClass(anyClass)) - \(type.description)")
        }
    }
}

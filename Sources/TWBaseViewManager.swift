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
        /// Only UIView, UIViewController` init`, `deinit`, `memory warning` logging
        case low
        /// UIView, UIViewController `init`, `deinit`, `memory warning`, `View Controller LifeCycle` logging
        case medium
        /// All view `init`, `deinit`, `memory warning`, `LifeCycle` logging
        case high
        
        var loggingTypes: [LoggingType] {
            var types = [LoggingType]()
            if self.rawValue >= 0 {
                types.append(contentsOf: [.viewInit, .viewDeInit, .memoryWarning])
            }
            if self.rawValue > 0 {
                types.append(contentsOf: [.viewDidLoad, .viewWillAppear,
                                          .viewDidAppear, .viewWillDisappear,
                                          .viewDidDisappear])
            }
            if self.rawValue > 1 {
                types.append(contentsOf: [.extViewInit, .extViewDeInit,])
            }
            return types
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
        case memoryWarning
        
        var description: String {
            switch self {
            case .viewInit, .extViewInit: return "👍 init"
            case .viewDeInit, .extViewDeInit: return "👎 deinit"
            case .memoryWarning: return "☠️ Memory Warning"
            default: return "👉🏼 \(self.rawValue)"
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

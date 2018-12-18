import Foundation
import UIKit

public extension UITextField {
    
    @IBInspectable public var localizedPlaceholder: String {
        get { return placeholder ?? "" }
        set {
            placeholder = newValue.localized
        }
    }
    
    @IBInspectable public var localizedText: String {
        get { return text ?? "" }
        set {
            text = newValue.localized
        }
    }
}

public extension UITextView {
    
    @IBInspectable public var localizedText: String {
        get { return text ?? "" }
        set {
            text = newValue.localized
        }
    }
}

public extension UIBarItem {
    
    @IBInspectable public var localizedTitle: String {
        get { return title ?? "" }
        set {
            title = newValue.localized
        }
    }
}

public extension UILabel {
    
    @IBInspectable public var localizedText: String {
        get { return text ?? "" }
        set {
            text = newValue.localized
        }
    }
}

public extension UINavigationItem {
    
    @IBInspectable public var localizedTitle: String {
        get { return title ?? "" }
        set {
            title = newValue.localized
        }
    }
}

public extension UIButton {
    
    @IBInspectable public var localizedTitle: String {
        get { return title(for: UIControl.State()) ?? "" }
        set {
            setTitle(newValue.localized, for: UIControl.State())
        }
    }
}

public extension UISearchBar {
    
    @IBInspectable public var localizedPrompt: String {
        get { return prompt ?? "" }
        set {
            prompt = newValue.localized
        }
    }
    
    @IBInspectable public var localizedPlaceholder: String {
        get { return placeholder ?? "" }
        set {
            placeholder = newValue.localized
        }
    }
}

public extension UISegmentedControl {
    
    @IBInspectable public var localized: String {
        get { return titleForSegment(at: selectedSegmentIndex) ?? "" }
        set {
            for index in 0..<numberOfSegments {
                if let title = titleForSegment(at: index) {
                    setTitle(title.localized, forSegmentAt: index)
                }
            }
        }
    }
}

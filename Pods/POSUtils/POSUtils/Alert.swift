import Foundation
import UIKit

public struct AlertInfo {
    public let title: String?
    public let message: String?
    public let actions: [AlertAction]
    
    public init(title: String? = nil, message: String? = nil, actions: [AlertAction] = []) {
        self.title = title
        self.message = message
        self.actions = actions
    }
}

public struct AlertAction {
    public let onSelect: (() -> Void)?
    public let name: String
    public let style: UIAlertAction.Style
    
    public init (onSelect: (() -> Void)? = nil, name: String, style: UIAlertAction.Style) {
        self.onSelect = onSelect
        self.name = name
        self.style = style
    }
}

public extension UIAlertController {
    public convenience init(info: AlertInfo, style: UIAlertController.Style = .alert) {
        self.init(title: info.title, message: info.message, preferredStyle: style)
        info.actions.forEach { actionInfo in
            let action = UIAlertAction(title: actionInfo.name,
                                       style: actionInfo.style,
                                       handler: { _ in
                                        guard let action = actionInfo.onSelect else { return }
                                        action()
            })
            addAction(action)
        }
    }
}

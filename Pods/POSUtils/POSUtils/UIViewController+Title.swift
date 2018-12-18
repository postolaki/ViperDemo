import UIKit

public extension UIViewController {
    func setPrefersLargeTitles(state: Bool=true) {
        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = state
        }
    }

    func setAttributedTitleText(largeTitleFont: UIFont?=nil, titleFont: UIFont?=nil, color: UIColor?=nil) {

        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key: Any]()
            if let color = color {
                navigationController?.navigationBar.largeTitleTextAttributes![NSAttributedString.Key.foregroundColor] = color
            }
            if let font = largeTitleFont {
                navigationController?.navigationBar.largeTitleTextAttributes![NSAttributedString.Key.font] = font
            }
        }
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key: Any]()
        if let color = color {
            navigationController?.navigationBar.titleTextAttributes![NSAttributedString.Key.foregroundColor] = color
        }
        if let font = titleFont {
            navigationController?.navigationBar.titleTextAttributes![NSAttributedString.Key.font] = font
        }
    }
}

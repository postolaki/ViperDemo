import Foundation
import UIKit

public class LoaderAlert: UIAlertController {
    public enum InitType {
        case `default`, title(String)
    }
    
    public convenience init(type: InitType) {
        var customTitle = "Please wait..."
        switch type {
        case .title(let title):
            customTitle = title
        default:
            break
        }
        self.init(title: customTitle, message: nil, preferredStyle: .alert)
        addIndicatorView()
    }
    
    private func addIndicatorView() {
        let indicator = UIActivityIndicatorView(frame: view.bounds)
        indicator.style = .gray
        indicator.center.x -= 70
        indicator.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        indicator.startAnimating()
        view.addSubview(indicator)
    }
    
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

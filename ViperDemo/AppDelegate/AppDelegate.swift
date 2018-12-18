import UIKit
import PluggableApplicationDelegate

@UIApplicationMain
class AppDelegate: PluggableApplicationDelegate {
    override var services: [ApplicationService] {
        window = UIWindow(frame: UIScreen.main.bounds)
        return [
            MainApplicationService(with: window)
        ]
    }
}

import Foundation
import PluggableApplicationDelegate

final class MainApplicationService: NSObject, ApplicationService {
    let window: UIWindow?
    
    init(with window: UIWindow?) {
        self.window = window
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        let countriesController = CountriesViewController.instantiate()
        let navigationController = UINavigationController(rootViewController: countriesController)
        setRootController(navigationController)
        
        return true
    }
    
    private func setRootController(_ controller: UIViewController) {
        window?.rootViewController = controller
        window?.makeKeyAndVisible()
    }
}

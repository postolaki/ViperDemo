import Foundation

final class CountryRouter: CountryRouterInput {
	weak var view: CountryViewInput?

	private var viewController: CountryViewController {
        guard let viewController = view as? CountryViewController else { fatalError("can't create view controller") }
        return viewController
    }
}

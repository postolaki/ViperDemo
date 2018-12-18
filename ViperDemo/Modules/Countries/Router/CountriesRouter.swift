import Foundation

final class CountriesRouter: CountriesRouterInput {
	weak var view: CountriesViewInput?

	private var viewController: CountriesViewController {
        guard let viewController = view as? CountriesViewController else { fatalError("can't create view controller") }
        return viewController
    }
    
    func didSelectCountry(_ country: CountryModel) {
        let countryViewController = CountryViewController.instantiate()
        if let presenter = countryViewController.output as? CountryPresenter {
            presenter.didReceiveCountry(country)
        }
        
        let backButton = UIBarButtonItem()
        viewController.navigationItem.backBarButtonItem = backButton
        viewController.navigationController?.pushViewController(countryViewController, animated: true)
    }
}

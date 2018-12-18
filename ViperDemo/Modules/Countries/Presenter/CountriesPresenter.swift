import Foundation

final class CountriesPresenter {

    weak var view: CountriesViewInput!
    var interactor: CountriesInteractorInput!
    var router: CountriesRouterInput!
}

// MARK: - CountriesModuleInput

extension CountriesPresenter: CountriesModuleInput {
	
}

// MARK: - CountriesViewOutput

extension CountriesPresenter: CountriesViewOutput {
	func viewIsReady() {
		router.view = view
		view.setupInitialState()
        view.showLoader()
        interactor.getAllCountries()
    }
    
    func searchBy(name: String) {
        view.showLoader()
        interactor.searchBy(name: name)
    }
    
    func resetSearch() {
        view.showLoader()
        interactor.getAllCountries()
    }
    
    func didSelectCountry(_ country: CountryModel) {
        router.didSelectCountry(country)
    }
}

// MARK: - CountriesInteractorOutput

extension CountriesPresenter: CountriesInteractorOutput {
    func didReceive(countries: [CountryModel]) {
        view.reloadWith(countries: countries)
        view.hideLoader()
    }
}

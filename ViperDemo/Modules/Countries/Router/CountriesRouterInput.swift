import Foundation

protocol CountriesRouterInput {
	var view: CountriesViewInput? {get set}
    func didSelectCountry(_ country: CountryModel)
}

import Foundation

protocol CountriesViewInput: class {
	func setupInitialState()
    func reloadWith(countries: [CountryModel])
    func showLoader()
    func hideLoader()
}

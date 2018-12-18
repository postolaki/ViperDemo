import Foundation

protocol CountryViewInput: class {
	func setupInitialState()
    func didReceiveCountry(_ country: CountryModel)
    func reloadData(with countryViewModels: [CountryViewModel])
}

import Foundation

protocol CountriesViewOutput {
    func viewIsReady()
    func searchBy(name: String)
    func resetSearch()
    func didSelectCountry(_ country: CountryModel)
}

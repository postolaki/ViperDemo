import Foundation

protocol CountriesInteractorOutput: class {
    func didReceive(countries: [CountryModel])
}

import Foundation

protocol CountriesInteractorInput {
    func getAllCountries()
    func searchBy(name: String)
}

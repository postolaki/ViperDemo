import Foundation

final class CountriesInteractor: CountriesInteractorInput {

    weak var output: CountriesInteractorOutput!
    private var request: Request?
    private let baseUrl = "https://restcountries.eu/rest/v2"

    func getAllCountries() {
        let url = URL(string: "\(baseUrl)/all")!
        getCountries(with: url)
    }
    
    func searchBy(name: String) {
        let url = URL(string: "\(baseUrl)/name/\(name)")!
        getCountries(with: url)
    }
    
    private func getCountries(with url: URL) {
        request?.cancel()
        let requestInputs = RequestInputs(url: url)
        request = Request(inputs: requestInputs)
        request?.requestModel(onSuccess: { [weak self] (countries: [CountryModel]) in
            self?.output.didReceive(countries: countries)
        }) { [weak self] error in
            self?.output.didReceive(countries: [])
        }
    }
}

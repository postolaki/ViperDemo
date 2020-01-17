import Foundation

final class CountriesInteractor: CountriesInteractorInput {

    private typealias CountriesResult = RequestManager.CodableResult<[CountryModel]>
    
    weak var output: CountriesInteractorOutput!
    private var requestManager: RequestManager?
    private let baseUrl = URL(string: "https://restcountries.eu/rest/v2")

    func getAllCountries() {
        guard let url = baseUrl?.appendingPathComponent("all") else { return }
        getCountries(with: url)
    }
    
    func searchBy(name: String) {
        guard let url = baseUrl?.appendingPathComponent("name/\(name)") else { return }
        getCountries(with: url)
    }
    
    private func getCountries(with url: URL) {
        requestManager?.cancelRequest()
        requestManager = RequestManager(url: url)
        requestManager?.makeCodableRequest(completionHandler: { [weak self] (result: CountriesResult) in
            let countries = result.value ?? []
            self?.output.didReceive(countries: countries)
        })
    }
}

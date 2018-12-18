import Foundation

final class CountryPresenter {
    
    weak var view: CountryViewInput!
    var interactor: CountryInteractorInput!
    var router: CountryRouterInput!
    
    private var country: CountryModel?
}

// MARK: - CountryModuleInput

extension CountryPresenter: CountryModuleInput {
    func didReceiveCountry(_ country: CountryModel) {
        self.country = country
    }
}

// MARK: - CountryViewOutput

extension CountryPresenter: CountryViewOutput {
    func viewIsReady() {
        router.view = view
        view.setupInitialState()
        guard let country = country else { return }
        view.didReceiveCountry(country)
        prepareCountryViewModels(country)
    }
    
    private func prepareCountryViewModels(_ country: CountryModel) {
        var countryViewModels = [CountryViewModel]()
        let countryMirror = Mirror(reflecting: country)
        for (name, value) in countryMirror.children {
            guard let name = name else { continue }
            if let cellType = CellType(rawValue: name),
                let value = value as? String, !value.isEmpty {
                let countryViewModel = CountryViewModel(title: cellType.title, value: value)
                countryViewModels.append(countryViewModel)
            }
        }
        view.reloadData(with: countryViewModels)
    }
}

// MARK: - CountryInteractorOutput

extension CountryPresenter: CountryInteractorOutput {
    
}

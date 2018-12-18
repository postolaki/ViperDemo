import UIKit

final class CountriesModuleConfigurator: NSObject {

    @objc func configureModule(for viewController: CountriesViewController) {
        configure(viewController: viewController)
    }

    private func configure(viewController: CountriesViewController) {

        let router = CountriesRouter()

        let presenter = CountriesPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = CountriesInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }
    
}

import UIKit

final class CountryModuleConfigurator: NSObject {

    @objc func configureModule(for viewController: CountryViewController) {
        configure(viewController: viewController)
    }

    private func configure(viewController: CountryViewController) {

        let router = CountryRouter()

        let presenter = CountryPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = CountryInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }
    
}

import XCTest
@testable import ViperDemo

class CountryModuleConfiguratorTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testConfigureModuleForViewController() {
        //given
        let viewController = CountryViewController.instantiate()
        let configurator = CountryModuleConfigurator()

        //when
        configurator.configureModule(for: viewController)

        //then
        XCTAssertNotNil(viewController.output, "CountryViewController is nil after configuration")
        XCTAssertTrue(viewController.output is CountryPresenter, "output is not CountryPresenter")

        let presenter: CountryPresenter = viewController.output as! CountryPresenter
        XCTAssertNotNil(presenter.view, "view in CountryPresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in CountryPresenter is nil after configuration")
        XCTAssertTrue(presenter.router is CountryRouter, "router is not CountryRouter")

        let interactor: CountryInteractor = presenter.interactor as! CountryInteractor
        XCTAssertNotNil(interactor.output, "output in CountryInteractor is nil after configuration")
    }
}

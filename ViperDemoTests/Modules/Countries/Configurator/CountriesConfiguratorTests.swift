import XCTest
@testable import ViperDemo

class CountriesModuleConfiguratorTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testConfigureModuleForViewController() {
        //given
        let viewController = CountriesViewController.instantiate()
        let configurator = CountriesModuleConfigurator()

        //when
        configurator.configureModule(for: viewController)

        //then
        XCTAssertNotNil(viewController.output, "CountriesViewController is nil after configuration")
        XCTAssertTrue(viewController.output is CountriesPresenter, "output is not CountriesPresenter")

        let presenter: CountriesPresenter = viewController.output as! CountriesPresenter
        XCTAssertNotNil(presenter.view, "view in CountriesPresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in CountriesPresenter is nil after configuration")
        XCTAssertTrue(presenter.router is CountriesRouter, "router is not CountriesRouter")

        let interactor: CountriesInteractor = presenter.interactor as! CountriesInteractor
        XCTAssertNotNil(interactor.output, "output in CountriesInteractor is nil after configuration")
    }
}

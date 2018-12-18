import XCTest
@testable import ViperDemo

class CountriesPresenterTest: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    class MockInteractor: CountriesInteractorInput {

    }

    class MockRouter: CountriesRouterInput {

    }

    class MockViewController: CountriesViewInput {

        func setupInitialState() {

        }
    }
}

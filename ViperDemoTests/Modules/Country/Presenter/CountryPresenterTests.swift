import XCTest
@testable import ViperDemo

class CountryPresenterTest: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    class MockInteractor: CountryInteractorInput {

    }

    class MockRouter: CountryRouterInput {

    }

    class MockViewController: CountryViewInput {

        func setupInitialState() {

        }
    }
}

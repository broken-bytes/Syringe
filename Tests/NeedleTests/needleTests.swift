import XCTest
@testable import Needle

final class NeedleTests: XCTestCase {
    func testExample() throws {
        // XCTest Documenation
        // https://developer.apple.com/documentation/xctest

        // Defining Test Cases and Test Methods
        // https://developer.apple.com/documentation/xctest/defining_test_cases_and_test_methods
    }

    func testSimpleDependency() throws {
        var appModule = module {
            factory {

            }
        }

        XCTFail(appModule.debugDescription)

        print(appModule)
    }
}

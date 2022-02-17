@testable import PwgenSwift
import XCTest

final class PwgenSwiftTests: XCTestCase {
    func testPasswordInit() throws {
        let password = Password()
        XCTAssertEqual(password.count, Password.defaultCount)
        XCTAssertEqual(password.length, Password.defaultLength)
        XCTAssertEqual(password.flags, Password.defaultFlags)
    }

    func testPerformance() throws {
        let password = Password(length: 100, count: 100, flags: .secure)
        var values = [String]()
        measure {
            values = (try? password.generate()) ?? []
        }
        print(values)
    }
}

@testable import PwgenSwift
import XCTest

final class PwgenSwiftTests: XCTestCase {
    func testPasswordInit() throws {
        let password = Password()
        XCTAssertEqual(password.count, Password.defaultCount)
        XCTAssertEqual(password.length, Password.defaultLength)
        XCTAssertEqual(password.flags, Password.defaultFlags)
    }
}

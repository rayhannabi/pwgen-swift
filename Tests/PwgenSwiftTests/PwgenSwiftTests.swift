@testable import PwgenSwift
import XCTest

final class PwgenSwiftTests: XCTestCase {
    func testPwgen() {
        let result = pwgen(Password.defaultLength, Password.defaultCount, Password.defaultFlags)
        XCTAssertEqual(result.count, 0)
    }

    func testPasswordInit() {
        let password = Password()
        XCTAssertEqual(password.count, Password.defaultCount)
        XCTAssertEqual(password.length, Password.defaultLength)
        XCTAssertEqual(password.flags, Password.defaultFlags)
    }
    
    func testPasswordGenerate() {
        let password = Password().generate()
        XCTAssertEqual(password.count, 0)
    }
}

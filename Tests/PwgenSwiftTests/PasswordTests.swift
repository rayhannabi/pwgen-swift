//
//  PasswordTests.swift
//
//
//  Created by Rayhan Nabi on 2/17/22.
//

@testable import PwgenSwift
import XCTest

class PasswordTests: XCTestCase {
    func testPwgen() throws {
        let result = pwgen(8, 1, .secure)
        XCTAssertEqual(result.count, 1)
        XCTAssertEqual(result[0].count, 8)
    }
    
    func testSinglePassword() throws {
        let password = try Password().generate().first
        XCTAssertNotNil(password)
        XCTAssertEqual(password?.count, 8)
        XCTAssertNotNil(password?.rangeOfCharacter(from: .uppercaseLetters))
        XCTAssertNotNil(password?.rangeOfCharacter(from: .decimalDigits))
    }
    
    func testPerformance() throws {
        let password = Password(length: 100, count: 100, flags: .secure)
        measure {
            _ = try! password.generate()
        }
    }
}

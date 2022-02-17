//
//  PasswordTests.swift
//
//
//  Created by Rayhan Nabi on 2/17/22.
//

@testable import PwgenSwift
import XCTest

class PasswordTests: XCTestCase {
    private var password: Password!

    override func setUp() {
        password = Password()
    }

    func value() throws -> String {
        let passwords = try password.generate()
        return passwords[0]
    }

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

    func testPasswordNoDigits() throws {
        password.flags = .noDigits
        XCTAssertNil(try value().rangeOfCharacter(from: .decimalDigits))
    }

    func testPasswordNoUppercase() throws {
        password.flags = .noUppercase
        XCTAssertNil(try value().rangeOfCharacter(from: .uppercaseLetters))
    }

    func testPasswordNoVowels() throws {
        password.flags = .noVowels
        XCTAssertNil(try value().rangeOfCharacter(from: CharacterSet(charactersIn: "aeiouAEIOU")))
    }

    func testPasswordSecure() throws {
        password.flags = .secure
        let value = try value()
        let numbersDigits = CharacterSet.lowercaseLetters
            .union(.uppercaseLetters)
            .union(.decimalDigits)
        XCTAssertNotNil(value.rangeOfCharacter(from: numbersDigits))
    }

    func testPasswordSecureSymbol() throws {
        password.flags = [.secure, .symbols]
        XCTAssertNotNil(try value().rangeOfCharacter(from: .alphanumerics))
    }
}

//
//  Password.swift
//  PwgenSwift
//
//  Created by Rayhan Nabi on 2/16/22.
//

import Foundation

// MARK: - Password

/// Password generator
public struct Password {
    /// Length of the password
    public var length = defaultLength

    /// Number of passwords to generate
    public var count = defaultCount

    /// Password flags and criteria
    public var flags = defaultFlags
}

public extension Password {
    /// Default password length 8
    static var defaultLength: Int { 8 }

    /// Default number of passwords 1
    static var defaultCount: Int { 1 }

    /// Default flags:
    static var defaultFlags: Int { 0x0001 }

    /// Generate the passwords
    /// - Returns: List of passwords
    func generate() -> [String] {
        return []
    }

    /// Generate passwords with given length and flags
    /// - Parameters:
    ///   - length: Length of the password
    ///   - count: Number of passwords to generate
    ///   - flags: Password flags and criteria
    /// - Returns: List of passwords
    static func generate(
        length: Int = defaultLength,
        count: Int = defaultCount,
        flags: Int = defaultFlags
    ) -> [String] {
        let password = Password(length: length, count: count, flags: flags)
        return password.generate()
    }
}

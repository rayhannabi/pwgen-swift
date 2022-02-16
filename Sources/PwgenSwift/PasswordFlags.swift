//
//  Flags.swift
//  PwgenSwift
//
//  Created by Rayhan Nabi on 2/16/22.
//

import Foundation

// MARK: - PasswordFlags

/// Options for generating password
public struct PasswordFlags: OptionSet {
    public let rawValue: Int

    /// Seed file path for hash based random generator
    ///
    /// SHA1 hash of given file is used as a (not so) random generator
    public var hashSeedPath: String?

    /// Characters to remove in passwords
    public var removingCharacters: String?

    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
}

public extension PasswordFlags {
    /// Contains digits
    static let digits = PasswordFlags(rawValue: 1 << 0)
    /// Contains no digits
    static let noDigits = PasswordFlags(rawValue: 1 << 1)
    /// Contains uppercase
    static let uppercase = PasswordFlags(rawValue: 1 << 2)
    /// Contains no uppercase
    static let noUppercase = PasswordFlags(rawValue: 1 << 3)
    /// Contains no ambiguous characters
    static let noAmbiguous = PasswordFlags(rawValue: 1 << 4)
    /// Contains symbols
    static let symbols = PasswordFlags(rawValue: 1 << 5)
    /// Contains no vowels to avoid words
    static let noVowels = PasswordFlags(rawValue: 1 << 6)
    /// Generates completely random passwords
    static let secure = PasswordFlags(rawValue: 1 << 7)

    /// File hash as random generator
    ///
    /// ``hashSeedPath`` needs to be set to use this option.
    /// Alternatively, ``hash(_:)`` method can also be used.
    static let hash = PasswordFlags(rawValue: 1 << 8)

    /// Characters to remove in passwords
    ///
    /// ``removingCharacters`` needs to be set to use this option.
    /// Alternatively, ``remove(_:)`` method can also be used.
    static let remove = PasswordFlags(rawValue: 1 << 9)

    /// File hash as random generator
    /// - Parameter seedPath: Seed file path for hash based random generator
    /// - Returns: ``hash`` option for password
    static func hash(_ seedPath: String) -> PasswordFlags {
        var flag = PasswordFlags.hash
        flag.hashSeedPath = seedPath
        return flag
    }

    /// Characters to remove in passwords
    /// - Parameter chars: String containing characters to remove
    /// - Returns: ``remove`` option for password
    static func remove(_ chars: String) -> PasswordFlags {
        var flag = PasswordFlags.remove
        flag.removingCharacters = chars
        return flag
    }

    /// Default options for password
    static let `default`: PasswordFlags = [.digits, .uppercase]
}

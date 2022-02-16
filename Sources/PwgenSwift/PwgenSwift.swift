//
//  PwgenSwift.swift
//  PwgenSwift
//
//  Created by Rayhan Nabi on 2/16/22.
//

import Foundation

/// Generates pronounceable passwords.
///
/// Use ``PasswordFlags/secure`` flag to generate
/// completely random passwords.
///
/// - Parameters:
///   - length: Length of password
///   - count: Number of passwords to generate
///   - flags: ``PasswordFlags`` to use
public func pwgen(_ length: Int, _ count: Int, _ flags: PasswordFlags) -> [String] {
    Password.generate(length: length, count: count, flags: flags)
}

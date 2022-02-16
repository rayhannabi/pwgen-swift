//
//  Password+Extra.swift
//  PwgenSwift
//
//  Created by Rayhan Nabi on 2/16/22.
//

import Cpwgen
import Foundation

extension Password {
    /// Generates a single password
    ///
    /// This method is mimicked from `Sources/Cpwgen/lib/pwgen.c` &
    /// essentially replaces the `main` function.
    /// - Parameters:
    ///   - length: Length of password
    ///   - flags: Password flags
    /// - Returns: A random password
    func generatePassword(_ length: Int, flags: PasswordFlags) throws -> String {
        guard length > 0 else { throw PasswordError.invalidLength }
        var generator = pw_phonemes
        pw_number = pw_random_number
        var isRandomGenerator = false
        var pwFlag: Int32 = 0
        var remove: String?
        pwFlag |= PW_DIGITS | PW_UPPERS

        if flags.contains(.noDigits) {
            pwFlag &= ~PW_DIGITS
        } else if flags.contains(.noUppercase) {
            pwFlag &= ~PW_UPPERS
        } else if flags.contains(.noAmbiguous) {
            pwFlag |= PW_AMBIGUOUS
        } else if flags.contains(.uppercase) {
            pwFlag |= PW_UPPERS
        } else if flags.contains(.digits) {
            pwFlag |= PW_DIGITS
        } else if flags.contains(.symbols) {
            pwFlag |= PW_SYMBOLS
        } else if flags.contains(.secure) {
            generator = pw_rand
            isRandomGenerator = true
        } else if flags.contains(.hash) {
            guard let path = flags.hashSeedPath else {
                throw PasswordError.hashSeedPathMissing
            }
            if var path = path.cString(using: .utf8) {
                pw_sha1_init(&path)
                pw_number = pw_sha1_number
            } else {
                throw PasswordError.hashSeedPathError
            }
        } else if flags.contains(.noVowels) {
            pwFlag |= PW_NO_VOWELS
            generator = pw_rand
            isRandomGenerator = true
        } else if flags.contains(.remove) {
            remove = flags.removingCharacters
            generator = pw_rand
            isRandomGenerator = true
        }

        if length < 5 {
            generator = pw_rand
            isRandomGenerator = true
        }

        if isRandomGenerator {
            if length <= 2 {
                pwFlag &= ~PW_UPPERS
            }
            if length <= 1 {
                pwFlag &= ~PW_DIGITS
            }
        }

        let buffer = UnsafeMutablePointer<CChar>.allocate(capacity: length + 1)
        defer { free(buffer) }
        var removeChars = remove?.cString(using: .utf8) ?? []
        generator(buffer, Int32(length), pwFlag, &removeChars)
        if let password = String(cString: buffer, encoding: .utf8) {
            return password
        } else {
            throw PasswordError.encodingError
        }
    }
}

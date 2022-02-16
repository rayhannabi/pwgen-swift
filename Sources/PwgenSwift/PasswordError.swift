//
//  PasswordError.swift
//  PwgenSwift
//
//  Created by Rayhan Nabi on 2/16/22.
//

import Foundation

// MARK: - PasswordError

/// Password generation related error
public enum PasswordError: LocalizedError {
    case invalidLength
    case encodingError
    case hashSeedPathMissing
    case hashSeedPathError

    public var errorDescription: String? {
        switch self {
        case .invalidLength:
            return "Password length must be a positive integer"
        case .encodingError:
            return "Error encoding string from buffer"
        case .hashSeedPathMissing:
            return "Hash option is selected but seed file path is missing"
        case .hashSeedPathError:
            return "Error processing hash seed file path"
        }
    }
}

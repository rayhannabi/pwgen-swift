//
//  Typealias.swift
//
//
//  Created by Rayhan Nabi on 2/17/22.
//

import Foundation

public typealias PWFlag = Int32
public typealias PWLength = Int32
public typealias CCharPointer = UnsafeMutablePointer<CChar>
public typealias CGeneratorFunction = (CCharPointer?, PWLength, PWFlag, CCharPointer?) -> Void

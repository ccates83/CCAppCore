//
//  Operations.swift
//  
//
//  Created by Connor Cates on 3/1/22.
//

import Foundation

public typealias Success<T> = (_ data: T) -> Void

public typealias Failure<E: Error> = (_ error: E?) -> Void

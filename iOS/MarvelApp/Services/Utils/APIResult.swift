//
//  APIResult.swift
//  MarvelApp
//
//  Created by Suyash Srijan on 17/04/2018.
//  Copyright © 2018 Suyash Srijan. All rights reserved.
//

import Foundation

public typealias APIResultCallback<Value> = (APIResult<Value>) -> Void

public enum APIResult<Value> {
    case success(Value)
    case failure(Error)
}

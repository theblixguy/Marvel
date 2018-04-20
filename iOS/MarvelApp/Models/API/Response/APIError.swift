//
//  APIError.swift
//  MarvelApp
//
//  Created by Suyash Srijan on 17/04/2018.
//  Copyright © 2018 Suyash Srijan. All rights reserved.
//

import Foundation

public enum APIError: Error {
    case encodingError
    case decodingError
    case serverError(message: String)
}

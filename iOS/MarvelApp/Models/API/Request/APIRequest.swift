//
//  APIRequest.swift
//  MarvelApp
//
//  Created by Suyash Srijan on 17/04/2018.
//  Copyright © 2018 Suyash Srijan. All rights reserved.
//

import Foundation

public protocol APIRequest: Encodable {
    associatedtype Response: Decodable
    
    var resourceName: String { get }
}

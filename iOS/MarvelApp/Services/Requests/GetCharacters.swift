//
//  GetCharacters.swift
//  MarvelApp
//
//  Created by Suyash Srijan on 17/04/2018.
//  Copyright © 2018 Suyash Srijan. All rights reserved.
//

import Foundation

public struct GetCharacters: APIRequest {
    public typealias Response = [Character]
    
    public var resourceName: String {
        return "characters"
    }
    
    public let limit: Int?
    public let orderBy: String?
    
    public init(limit: Int? = nil, orderBy: String? = nil) {
        self.limit = limit
        self.orderBy = orderBy
    }
}

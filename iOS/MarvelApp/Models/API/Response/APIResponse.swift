//
//  APIResponse.swift
//  MarvelApp
//
//  Created by Suyash Srijan on 17/04/2018.
//  Copyright © 2018 Suyash Srijan. All rights reserved.
//

import Foundation

public struct APIResponse<Response: Decodable>: Decodable {
    public let status: String?
    public let message: String?
    public let data: DataContainer<Response>?
}

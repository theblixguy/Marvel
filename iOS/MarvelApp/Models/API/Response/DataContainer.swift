//
//  DataContainer.swift
//  MarvelApp
//
//  Created by Suyash Srijan on 17/04/2018.
//  Copyright © 2018 Suyash Srijan. All rights reserved.
//

import Foundation

public struct DataContainer<Results: Decodable>: Decodable {
    public let results: Results
    
    public init(offset: Int = 0, limit: Int = 0, total: Int = 0, count: Int = 0, results: Results) {
        self.results = results
    }
}

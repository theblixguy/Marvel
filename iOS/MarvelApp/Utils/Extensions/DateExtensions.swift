//
//  Date+ToMillis.swift
//  MarvelApp
//
//  Created by Suyash Srijan on 20/04/2018.
//  Copyright © 2018 Suyash Srijan. All rights reserved.
//

import Foundation

extension Date {
    func toMillis() -> Int64 {
        return Int64(self.timeIntervalSince1970 * 1000)
    }
    
    func toMillisString() -> String {
        return String(toMillis())
    }
}

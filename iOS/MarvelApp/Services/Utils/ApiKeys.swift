//
//  ApiKeys.swift
//  MarvelApp
//
//  Created by Suyash Srijan on 18/04/2018.
//  Copyright © 2018 Suyash Srijan. All rights reserved.
//

import Foundation

class ApiKeys {
    
    private static func valueForAPIKey(named keyname: String) -> String {
        let filePath = Bundle.main.path(forResource: "apikeys", ofType: "plist")
        let plist = NSDictionary(contentsOfFile:filePath!)
        let value = plist?.object(forKey: keyname) as! String
        return value
    }
    
    static func getPublicKey() -> String {
        return self.valueForAPIKey(named: "MARVEL_PUBLIC_KEY")
    }
    
    static func getPrivateKey() -> String {
        return self.valueForAPIKey(named: "MARVEL_PRIVATE_KEY")
    }
    
}

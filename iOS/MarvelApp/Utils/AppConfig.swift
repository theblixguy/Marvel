//
//  AppConfig.swift
//  MarvelApp
//
//  Created by Suyash Srijan on 20/04/2018.
//  Copyright © 2018 Suyash Srijan. All rights reserved.
//

import Foundation

class AppConfig {
    
    static func enforceAPIKeysAreSetUp() {
        if ApiKeys.getPublicKey().isEmpty && ApiKeys.getPrivateKey().isEmpty {
            fatalError("The Marvel API public and private keys are not set up. Please set MARVEL_PUBLIC_KEY & MARVEL_PUBLIC_KEY in apikeys.plist.")
        }
    }
}

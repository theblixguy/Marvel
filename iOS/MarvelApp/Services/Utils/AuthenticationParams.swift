//
//  AuthenticationParams.swift
//  MarvelApp
//
//  Created by Suyash Srijan on 20/04/2018.
//  Copyright © 2018 Suyash Srijan. All rights reserved.
//

import Foundation

class AuthenticationParams {
    
    public enum ParamType {
        case HASH
        case TIMESTAMP
        case PUBLIC_KEY
    }
    
    static func generateAuthParams() -> [ParamType : String] {
        let timeStamp = Date().toMillisString()
        let toHash: String = timeStamp + ApiKeys.getPrivateKey() + ApiKeys.getPublicKey()
        let md5Hash = toHash.MD5!
        
        var authDict = [ParamType : String]()
        authDict[ParamType.HASH] = md5Hash
        authDict[ParamType.TIMESTAMP] = timeStamp
        authDict[ParamType.PUBLIC_KEY] = ApiKeys.getPublicKey()
        
        return authDict
    }
    
}

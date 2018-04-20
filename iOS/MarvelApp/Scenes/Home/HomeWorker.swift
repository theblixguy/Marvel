//
//  HomeWorker.swift
//  MarvelApp
//
//  Created by Suyash Srijan on 17/04/2018.
//  Copyright © 2018 Suyash Srijan. All rights reserved.
//

import Foundation

class HomeWorker {
    func fetchCharactersFromAPI(count: Int? = nil, orderBy: SortingOrder? = nil, requestManager: RequestManagerProtocol, completion: @escaping (DataContainer<[Character]>?) -> Void) {
        
        if !NetworkUtils.isInternetConnectionAvailable() {
            completion(nil)
        }
        
        requestManager.fetchCharacters(count: count, orderBy: orderBy) { (data) in
            if let data = data {
                completion(data)
            } else {
                completion(nil)
            }
        }
    }
}

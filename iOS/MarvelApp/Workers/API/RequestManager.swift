//
//  RequestManager.swift
//  MarvelApp
//
//  Created by Suyash Srijan on 17/04/2018.
//  Copyright © 2018 Suyash Srijan. All rights reserved.
//

import Foundation

class RequestManager: RequestManagerProtocol {
    
    private let apiClient: MarvelAPIClient = MarvelAPIClient()
    
    func fetchCharacters(count: Int? = nil, orderBy: SortingOrder? = nil, completion: @escaping (DataContainer<[Character]>?) -> Void) {
        apiClient.get(GetCharacters(limit: count, orderBy: orderBy?.rawValue)) { response in
            switch response {
            case .success(let dataContainer):
                completion(dataContainer)
            case .failure:
                completion(nil)
            }
        }
    }
}

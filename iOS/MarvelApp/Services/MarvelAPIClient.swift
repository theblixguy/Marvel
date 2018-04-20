//
//  MarvelAPI.swift
//  MarvelApp
//
//  Created by Suyash Srijan on 17/04/2018.
//  Copyright © 2018 Suyash Srijan. All rights reserved.
//

import Foundation

public class MarvelAPIClient {
    private let baseEndpoint = "https://gateway.marvel.com/v1/public/"
    private let session = URLSession(configuration: .default)
    
    private let publicKey: String
    private let hash: String
    private let timeStamp: String
    
    init() {
        let authParams = AuthenticationParams.generateAuthParams()
        publicKey = authParams[AuthenticationParams.ParamType.PUBLIC_KEY]!
        hash = authParams[AuthenticationParams.ParamType.HASH]!
        timeStamp = authParams[AuthenticationParams.ParamType.TIMESTAMP]!
    }
    
    public func get<T: APIRequest>(_ request: T, completion: @escaping APIResultCallback<DataContainer<T.Response>>) {
        
        let endpoint = self.createEndpoint(for: request)
        
        let task = session.dataTask(with: URLRequest(url: endpoint)) { data, _, error in
            if let data = data {
                do {
                    let apiResponse = try JSONDecoder().decode(APIResponse<T.Response>.self, from: data)
                    if let dataContainer = apiResponse.data {
                        completion(.success(dataContainer))
                    } else if let message = apiResponse.message {
                        completion(.failure(APIError.serverError(message: message)))
                    } else {
                        completion(.failure(APIError.decodingError))
                    }
                } catch {
                    completion(.failure(error))
                }
            } else if let error = error {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    private func createEndpoint<T: APIRequest>(for request: T) -> URL {
        guard let parameters = try? QueryEncoder.encodeQuery(request) else { fatalError("The parameters passed are invalid!") }
        
        return URL(string: "\(baseEndpoint)\(request.resourceName)?ts=\(timeStamp)&hash=\(hash)&apikey=\(publicKey)&\(parameters)")!
    }
}

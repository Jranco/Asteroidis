//
//  ApiClient.swift
//  Asteroidis
//
//  Created by Thomas Segkoulis on 29/10/20.
//  Copyright © 2020 Thomas Segkoulis. All rights reserved.
//

import Foundation

struct ApiClientRequestError: LocalizedError {
    
    var statusCode: Int
    
    var errorDescription: String? {
        return "http request failed with status code: \(statusCode)"
    }
}

class ApiClient {
    
    // MARK: - Instance
    
    static let shared = ApiClient()
    
    // MARK: - Private properties
    
    private var session: URLSession
    
    // MARK: - LifeCycle
    
    init() {
        session = URLSession.shared
    }
    
    // MARK: - Generic Request

    func load<T: ApiRequestProtocol>(withRequest request: T,
                                     withBodyParameters bodyParams: [String: Any],
                                     onSuccess completionSuccess: @escaping (_ result: T.Response.ResultsType) -> (),
                                     onError completionError: @escaping (_ error: Error) -> ()) {
        
        
        // TODO config http method
        
        let dataTask = RestManager.shared.session.dataTask(with: request.urlComponents.url!) { (data, urlRespose, error) in
            
            if let error = error {
                
                completionError(error)
                
            } else {
                
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .formatted(DateFormatter.iso8601Full)

                do {
                    let responseObj = try decoder.decode(T.Response.self, from: data!)
                    
                    switch responseObj.result {
                    case .success(let value): completionSuccess(value)
                    case .failure(let error): completionError(error)
                    }
                    
                } catch {
                    completionError(error)
                }
            }
        }
        
        dataTask.resume()
    }
}

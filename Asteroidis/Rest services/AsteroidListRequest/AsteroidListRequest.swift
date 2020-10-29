//
//  AsteroidListRequest.swift
//  Asteroidis
//
//  Created by Thomas Segkoulis on 29/10/20.
//  Copyright © 2020 Thomas Segkoulis. All rights reserved.
//

import Foundation

fileprivate struct Constants {
    
    static var apiKey: String { return "" }
}

class AsteroidListRequest: ApiRequestProtocol {
    
    typealias Response = AsteroidListResponse
    
    var urlComponents: URLComponents {
        return URLComponents(string: "https://api.nasa.gov/neo/rest/v1/feed?start_date=2020-10-19&end_date=2020-10-19&api_key=DEMO_KEY")!
    }
}

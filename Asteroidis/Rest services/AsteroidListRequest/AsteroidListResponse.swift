//
//  AsteroidListResponse.swift
//  Asteroidis
//
//  Created by Thomas Segkoulis on 29/10/20.
//  Copyright © 2020 Thomas Segkoulis. All rights reserved.
//

import Foundation

class AsteroidListResponse: Decodable, ResponseProtocol {
    
    enum AsteroidListResponseError: Error {
        case couldNotFetchAsteroidList
    }
    
    typealias ResultsType = AsteroidList

    var asteroidList: AsteroidList?
    
    var result: DAResult<AsteroidList> {
        
        guard let asteroidListStrong = asteroidList else {
            return DAResult.failure(AsteroidListResponseError.couldNotFetchAsteroidList)
        }
        return DAResult.success(asteroidListStrong)
    }
    
    required init(from decoder: Decoder) throws {
        self.asteroidList = try? AsteroidList(from: decoder)
    }
}

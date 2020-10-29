//
//  AsteroidListItem.swift
//  Asteroidis
//
//  Created by Thomas Segkoulis on 29/10/20.
//  Copyright © 2020 Thomas Segkoulis. All rights reserved.
//

import Foundation

struct AsteroidListItem: Decodable {
    let id: String
    let name: String
    let isHazardous: Bool
    
    private enum CodingKeys : String, CodingKey {
        case id
        case name
        case isHazardous = "is_potentially_hazardous_asteroid"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        isHazardous = try values.decode(Bool.self, forKey: .isHazardous)
        name        = try values.decode(String.self, forKey: .id)
        id          = try values.decode(String.self, forKey: .id)
    }
}

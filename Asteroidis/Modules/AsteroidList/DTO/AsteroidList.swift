//
//  AsteroidList.swift
//  Asteroidis
//
//  Created by Thomas Segkoulis on 29/10/20.
//  Copyright © 2020 Thomas Segkoulis. All rights reserved.
//

import Foundation

struct AsteroidList: Decodable {
    
    struct Links: Decodable {
        let next: String?
        let prev: String?
        let `self`: String
    }
    
    struct NearEarthObjects: Decodable {
        typealias DateStr = String
        var objects: [DateStr: [AsteroidListItem]]
        
        struct DynamicKey: CodingKey {
            var stringValue: String
            var intValue: Int?
            
            init?(stringValue: String) {
                self.stringValue = stringValue
            }
            
            init?(intValue: Int) {
                self.intValue = intValue
                self.stringValue = "\(intValue)"
            }
        }
        
        init(from decoder: Decoder) throws {
            
            let container = try decoder.container(keyedBy: DynamicKey.self)
            
            var tmpObjects: [DateStr: [AsteroidListItem]] = [:]
            
            for key in container.allKeys {
                let decodedObjects = try container.decode([AsteroidListItem].self, forKey: DynamicKey(stringValue: key.stringValue)!)
                tmpObjects[key.stringValue] = decodedObjects
            }
            
            self.objects = tmpObjects
        }
    }
    
    let links: Links
    let elementCount: Int
    let nearEarthObjects: NearEarthObjects
    
    private enum CodingKeys : String, CodingKey {
        case links
        case elementCount = "element_count"
        case nearEarthObjects = "near_earth_objects"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.links            = try values.decode(Links.self, forKey: .links)
        self.elementCount     = try values.decode(Int.self, forKey: .elementCount)
        self.nearEarthObjects = try values.decode(NearEarthObjects.self, forKey: .nearEarthObjects)
    }
}

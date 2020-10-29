//
//  RestManager.swift
//  Asteroidis
//
//  Created by Thomas Segkoulis on 29/10/20.
//  Copyright © 2020 Thomas Segkoulis. All rights reserved.
//

import Foundation

@objc class RestManager: NSObject {
    
    // MARK: - Instance
    
    static let shared = RestManager()
    
    // MARK: - Private Properties
    
    var session: URLSession
    
    // MARK: - LifeCycle
    
    override init() {
        session = URLSession.shared
        // NOTE: configure session here
    }
}

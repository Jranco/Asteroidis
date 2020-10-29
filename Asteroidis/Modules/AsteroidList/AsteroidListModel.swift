//
//  AsteroidListModel.swift
//  Asteroidis
//
//  Created by Thomas Segkoulis on 29/10/20.
//  Copyright © 2020 Thomas Segkoulis. All rights reserved.
//

import Foundation

protocol AsteroidListModelProtocol: ModelProtocol {
    var items: [AsteroidListItem] { get }
    func reloadAsteroidList(completionBlock: @escaping () -> Void)
}

class AsteroidListModel: AsteroidListModelProtocol {
        
    // MARK: - Private properties
    
    var items: [AsteroidListItem] { return _items }
    private var _items: [AsteroidListItem] = []
    
    // MARK: - Public methods
    
    func reloadAsteroidList(completionBlock: @escaping () -> Void) {
        
        let request = AsteroidListRequest()
        
        ApiClient.shared.load(withRequest: request,
                              withBodyParameters: [:], onSuccess: { [weak self] (result) in
            
                                let objectArrays = result.nearEarthObjects.objects.values
                                let objects = objectArrays.flatMap { $0 }
                                self?._items = objects
                                completionBlock()
        }) { (error) in
            self._items = []
            completionBlock()
        }
    }
}

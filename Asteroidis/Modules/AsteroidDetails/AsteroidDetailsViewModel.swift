//
//  AsteroidDetailsViewModel.swift
//  Asteroidis
//
//  Created by Thomas Segkoulis on 29/10/20.
//  Copyright © 2020 Thomas Segkoulis. All rights reserved.
//

import Foundation

protocol AsteroidDetailsViewModelProtocol: CoordinatedViewModelProtocol {
}

class AsteroidDetailsViewModel<Model: AsteroidDetailsModelProtocol>: AsteroidDetailsViewModelProtocol {
    
    // MARK: - Model
    
    var model: Model?
    
    // MARK: - Coordinator
    
    var coordinatorDelegate: CoordinatorDelegate? { return coordinator }
    private weak var coordinator: AsteroidDetailsCoordinatorDelegate?
    
    // MARK: LifeCycle
    
    init(model: Model, coordinator: AsteroidDetailsCoordinatorDelegate) {
        self.model = model
        self.coordinator = coordinator
    }
    
    func didLoad() {}

    func willAppear() {}
    
    func didAppear() {}
    
    func willDisappear() {}
}

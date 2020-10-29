//
//  CoordinatedViewModelProtocol.swift
//  Asteroidis
//
//  Created by Thomas Segkoulis on 28/10/20.
//  Copyright © 2020 Thomas Segkoulis. All rights reserved.
//

import Foundation

protocol CoordinatedViewModelProtocol: ViewModelProtocol {
    var coordinatorDelegate: CoordinatorDelegate? { get }
}

extension CoordinatedViewModelProtocol {
    func willBeRemovedFromParent() {
        self.coordinatorDelegate?.didFinish()
    }
}

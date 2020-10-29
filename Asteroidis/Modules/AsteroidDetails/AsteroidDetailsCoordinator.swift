//
//  AsteroidDetailsCoordinator.swift
//  Asteroidis
//
//  Created by Thomas Segkoulis on 29/10/20.
//  Copyright © 2020 Thomas Segkoulis. All rights reserved.
//

import Foundation
import UIKit

protocol AsteroidDetailsCoordinatorDelegate: CoordinatorDelegate {
}

class AsteroidDetailsCoordinator: CoordinatorProtocol, AsteroidDetailsCoordinatorDelegate {
    var navigationController: UINavigationController?
    var coordinators: [String : CoordinatorProtocol] = [:]
    var viewController: UIViewController?
    var navigationMode: CoordinatorNavigationMode?
    var presenter: CoordinatorProtocol?
    
    init() {
        let model = AsteroidDetailsModel()
        let viewModel = AsteroidDetailsViewModel(model: model, coordinator: self)
        self.viewController = AsteroidDetailsViewController(viewModel: viewModel)
    }
}

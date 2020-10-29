//
//  AsteroidListCoordinator.swift
//  Asteroidis
//
//  Created by Thomas Segkoulis on 29/10/20.
//  Copyright © 2020 Thomas Segkoulis. All rights reserved.
//

import Foundation
import UIKit

protocol AsteroidListCoordinatorDelegate: CoordinatorDelegate {
    func showAsteroidDetails(item: AsteroidListItem)
}

class AsteroidListCoordinator: CoordinatorProtocol, AsteroidListCoordinatorDelegate {
    var navigationController: UINavigationController?
    var coordinators: [String : CoordinatorProtocol] = [:]
    var viewController: UIViewController?
    var navigationMode: CoordinatorNavigationMode?
    var presenter: CoordinatorProtocol?
    
    init() {
        let model = AsteroidListModel()
        let viewModel = AsteroidListViewModel(model: model, coordinator: self)
        self.viewController = AsteroidListViewController(viewModel: viewModel)
    }
    
    // MARK: - AsteroidListCoordinatorDelegate
    
    func showAsteroidDetails(item: AsteroidListItem) {
        let detailsCoordinator = AsteroidDetailsCoordinator()
        detailsCoordinator.start(presenter: self, withNavigationMode: .push)
    }
}

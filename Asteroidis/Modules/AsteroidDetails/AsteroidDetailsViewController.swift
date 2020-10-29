//
//  AsteroidDetailsViewController.swift
//  Asteroidis
//
//  Created by Thomas Segkoulis on 29/10/20.
//  Copyright © 2020 Thomas Segkoulis. All rights reserved.
//

import UIKit

class AsteroidDetailsViewController<ViewModel: AsteroidDetailsViewModelProtocol>: UIViewController, CoordinatedViewProtocol {

    // MARK: - ViewModel
    
    var viewModel: ViewModel?
    
    // MARK: - LifeCycle
    
    convenience init(viewModel: ViewModel) {
        self.init(nibName: String(describing: "AsteroidDetailsViewController"), bundle: nil)
        self.viewModel = viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel?.didLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.viewModel?.willAppear()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.viewModel?.didAppear()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.viewModel?.willDisappear()
        
        if self.isMovingFromParent {
            self.viewModel?.willBeRemovedFromParent()
        }
    }
}

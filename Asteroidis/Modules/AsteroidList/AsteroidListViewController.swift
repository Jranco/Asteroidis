//
//  AsteroidListViewController.swift
//  Asteroidis
//
//  Created by Thomas Segkoulis on 29/10/20.
//  Copyright © 2020 Thomas Segkoulis. All rights reserved.
//

import UIKit

class AsteroidListViewController<ViewModel: AsteroidListViewModelProtocol>: UIViewController, CoordinatedViewProtocol {

    // MARK: - Subviews
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - ViewModel
    
    var viewModel: ViewModel?
    
    // MARK: - LifeCycle
    
    convenience init(viewModel: ViewModel) {
        self.init(nibName: String(describing: "AsteroidListViewController"), bundle: nil)
        self.viewModel = viewModel
        self.viewModel?.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel?.didLoad()
        
        configureSubviews()
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
    
    func configureSubviews() {
        
        if let viewModelTableViewDelegate = self.viewModel as? UITableViewDelegate {
            tableView.delegate = viewModelTableViewDelegate
        }
        
        if let viewModelTableViewDatasource = self.viewModel as? UITableViewDataSource {
            tableView.dataSource = viewModelTableViewDatasource
        }
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")

    }
    
    // MARK: - Public methods
}

// MARK: - AsteroidListViewModelDelegate

extension AsteroidListViewController: AsteroidListViewModelDelegate {
    func viewModelReload() {
        DispatchQueue.main.async {
            self.tableView?.reloadData()
        }
    }
}

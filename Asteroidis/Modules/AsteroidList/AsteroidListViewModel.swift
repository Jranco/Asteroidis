//
//  AsteroidListViewModel.swift
//  Asteroidis
//
//  Created by Thomas Segkoulis on 29/10/20.
//  Copyright © 2020 Thomas Segkoulis. All rights reserved.
//

import Foundation
import UIKit

protocol AsteroidListViewModelProtocol: CoordinatedViewModelProtocol {
    var delegate: AsteroidListViewModelDelegate? { get set }
}

protocol AsteroidListViewModelDelegate: class {
    func viewModelReload()
}

class AsteroidListViewModel<Model: AsteroidListModelProtocol>: NSObject, AsteroidListViewModelProtocol, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Model
    
    var model: Model?
    
    // MARK: - Delegate
    
    weak var delegate: AsteroidListViewModelDelegate?
    
    // MARK: - Coordinator
    
    var coordinatorDelegate: CoordinatorDelegate? { return coordinator }
    private weak var coordinator: AsteroidListCoordinatorDelegate?
    
    // MARK: LifeCycle
    
    init(model: Model, coordinator: AsteroidListCoordinatorDelegate) {
        self.model = model
        self.coordinator = coordinator
    }
    
    func didLoad() {}

    func willAppear() {}
    
    func didAppear() {
        self.model?.reloadAsteroidList {
            self.delegate?.viewModelReload()
        }
    }
    
    func willDisappear() {}
    
    // MARK: - UITableViewDelegate, UITableViewDataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.model?.items.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        if let model = self.model {
            
            let item = model.items[indexPath.row]
            
            cell?.textLabel?.numberOfLines = 0
            cell?.textLabel?.text = "asteroid name:" + item.name + "\n is Hazardous: \(item.isHazardous ? "yeap" : "not at all")"
        } else {
            cell?.textLabel?.text = ""
        }
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let modelStrong = model else {
            return
        }
        
        self.coordinator?.showAsteroidDetails(item: modelStrong.items[indexPath.row])
    }
}

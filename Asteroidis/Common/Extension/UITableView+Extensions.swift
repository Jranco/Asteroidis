//
//  UITableView+Extensions.swift
//  fibo
//
//  Created by Thomas Segkoulis on 10/05/2018.
//  Copyright © 2018 Jranco. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    
//    func register<T: UITableViewCell>(_: T.Type) {
//        
//        let nib = UINib(nibName: T.nibName, bundle: nil)
//        register(nib, forCellReuseIdentifier: T.reuseIdentifier)
//    }
    
    func dequeueReusableCell<T: UITableViewCell>(forIndexPath indexPath: IndexPath, ofType type: T.Type) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        
        return cell
    }
}

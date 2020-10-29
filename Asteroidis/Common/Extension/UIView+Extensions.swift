//
//  UIView+Extensions.swift
//  fibo
//
//  Created by Thomas Segkoulis on 18/06/2018.
//  Copyright © 2018 Jranco. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func addConstraints(parent: UIView, topView: UIView? = nil, bottomView: UIView? = nil,
                        leftView: UIView? = nil, rightView: UIView? = nil,
                        horizontalSpacing: CGFloat = 0.0, verticalSpacing: CGFloat = 64.0) {
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.leftAnchor.constraint(equalTo: leftView?.rightAnchor ?? parent.leftAnchor, constant: horizontalSpacing),
            self.rightAnchor.constraint(equalTo: rightView?.leftAnchor ?? parent.rightAnchor, constant: -horizontalSpacing),
            self.topAnchor.constraint(equalTo: topView?.bottomAnchor ?? parent.topAnchor, constant: verticalSpacing),
            self.bottomAnchor.constraint(equalTo: bottomView?.topAnchor ?? parent.bottomAnchor, constant: -verticalSpacing)
            ])
    }
}

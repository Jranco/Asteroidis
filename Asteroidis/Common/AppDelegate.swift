//
//  AppDelegate.swift
//  Asteroidis
//
//  Created by Thomas Segkoulis on 29/10/20.
//  Copyright © 2020 Thomas Segkoulis. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private var rootCoordinator: CoordinatorProtocol?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let window = UIWindow(frame:UIScreen.main.bounds)
        self.window = window
        
        let coordinator = AsteroidListCoordinator()
        self.rootCoordinator = coordinator
        coordinator.startAsRoot(window: window)
        
//        window.rootViewController = UIViewController()
        return true
    }
}

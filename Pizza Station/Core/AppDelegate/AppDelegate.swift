//
//  AppDelegate.swift
//  Pizza Station
//
//  Created by Shadi Elattar on 10/11/21.
//

import UIKit
import SVProgressHUD

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var coordinator: AppCoordinator!
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        coordinator = AppCoordinator()
        coordinator.start()
        SVProgressHUD.setDefaultMaskType(.black)
        window = UIWindow(frame: UIScreen.main.bounds)
        return true
    }
    
    
    
}


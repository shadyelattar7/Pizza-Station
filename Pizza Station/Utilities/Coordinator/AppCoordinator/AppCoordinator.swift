//
//  AppCoordinator.swift
//  Pizza Station
//
//  Created by Shadi Elattar on 10/12/21.
//

import Foundation
import UIKit

class AppCoordinator{
    let window: UIWindow
    
    init(window: UIWindow = UIWindow()) {
        self.window = window
    }
    
    func start (){
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
    }
    
    //MARK:- To make logic here ->
    var rootViewController: UIViewController{
        return CustomTabBarController()
    }
}

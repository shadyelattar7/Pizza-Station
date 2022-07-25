//
//  CartNavigator.swift
//  Pizza Station
//
//  Created by Shadi Elattar on 10/31/21.
//

import Foundation
import UIKit

class CartNavigator: Navigator{
    var coordentor: Coordinator

    private let storyboard: AppStoryboard = .Cart
    
    enum Destination{
        case cart
       
    }
    
    required init(coordentor: Coordinator) {
        self.coordentor = coordentor
    }
    
    func viewController(for destination: Destination) -> UIViewController {
        switch destination{
        case .cart:
            let viewModel = CartViewModel()
            let view = CartVC.instantiate(fromAppStoryboard: storyboard)
            view.viewModel = viewModel
            view.coordinator = coordentor
          return view
       
        }
    }
}

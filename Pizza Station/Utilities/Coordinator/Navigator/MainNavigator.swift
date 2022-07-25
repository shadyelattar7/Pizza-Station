//
//  MainNavigator.swift
//  Pizza Station
//
//  Created by Shadi Elattar on 10/12/21.
//

import Foundation
import UIKit

class MainNavigator: Navigator{
    var coordentor: Coordinator

    enum Destination{
        case home
        case itemDetails(product: Product)
    }
    
    required init(coordentor: Coordinator) {
        self.coordentor = coordentor
    }
    
    func viewController(for destination: Destination) -> UIViewController {
        switch destination{
        case .home:
            let homeRepo = HomeRepositoryImpl()
            let viewModel = HomeViewModel(homeRepository: homeRepo)
            let view = HomeVC(viewModel: viewModel, coordinator: coordentor)
          return view
        case .itemDetails(let product):
            let viewModel = itemDetailesViewModel(product: product)
            let view = ItemDetailesVC(viewModel: viewModel, coordinator: coordentor)
          return view
        }
    }
}

//
//  CustomTabBarController.swift
//  Pizza Station
//
//  Created by Shadi Elattar on 10/12/21.
//

import UIKit

class CustomTabBarController: UITabBarController {
    
    let coordinator: Coordinator
    
    init(coordinator: Coordinator) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    enum TabBarItem: Int, CaseIterable{
        case Home
        case PizzaMaker
        case Cart
    }
    
    
    lazy var middleButton: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "pizza"), for: .normal)
        button.isCircle = true
        button.backgroundColor = UIColor.rgb(red: 229, green: 41, blue: 62)
        return button
    }()
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        middleButton.layer.cornerRadius = 30
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setValue(CustomTabBar(), forKey: "tabBar")
        setupTabBarItem()
        setupTabBarUI()
        createMiddleButton()
    }
    
    private func createMiddleButton(){
        self.tabBar.addSubview(middleButton)
        middleButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            middleButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            middleButton.widthAnchor.constraint(equalToConstant: 60),
            middleButton.heightAnchor.constraint(equalToConstant: 60),
            middleButton.topAnchor.constraint(equalTo: tabBar.topAnchor, constant: -25)
            
        ])
        
    }
    
    private func setupTabBarUI(){
        tabBar.tintColor = .systemRed
        tabBar.unselectedItemTintColor = #colorLiteral(red: 0.02792824991, green: 0.1354275942, blue: 0.2667473555, alpha: 1)
        tabBar.items?[TabBarItem.PizzaMaker.rawValue].isEnabled = false
        middleButton.addTarget(self, action: #selector(didPressMiddleButton), for: .touchUpInside)
        
    }
    
    @objc func didPressMiddleButton(){
        print("1234")
        
        selectedIndex = TabBarItem.PizzaMaker.rawValue
    }
    
    private func setupTabBarItem(){
        self.viewControllers = TabBarItem.allCases.map({
         let view = viewControllerForTabBarItem($0)
         let navigation = UINavigationController(rootViewController: view)
         return navigation})
    }
    
    func viewControllerForTabBarItem(_ item: TabBarItem) -> UIViewController{
        switch item{
        case .Home:
            let view = coordinator.Main.viewController(for: .home)
            view.tabBarItem = tabBarItem(for: item)
            return view
        case .PizzaMaker:
            let view = UIViewController()
            //view.tabBarItem = tabBarItem(for: item)
            return view
        case .Cart:
            let view = coordinator.Cart.viewController(for: .cart)
            view.tabBarItem = tabBarItem(for: item)
            return view
        }
    }
    
    private func tabBarItem(for item: TabBarItem) -> UITabBarItem?{
        let tabBarItem: UITabBarItem
        switch item{
        case .Home:
            tabBarItem = .init(title: "Home", image: #imageLiteral(resourceName: "Home"), selectedImage: #imageLiteral(resourceName: "Home"))
        case .PizzaMaker:
            return nil
        case .Cart:
            tabBarItem = .init(title: "Cart", image: #imageLiteral(resourceName: "Iconly-Broken-Buy"), selectedImage: #imageLiteral(resourceName: "Iconly-Broken-Buy"))
        }
        tabBarItem.titlePositionAdjustment = .init(horizontal: 0, vertical: 15)
        tabBarItem.imageInsets = .init(top: 10, left: 0, bottom: -10, right: 0  )
        return tabBarItem
    }
}

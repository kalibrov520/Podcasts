//
//  MainTabBarController.swift
//  Podcasts
//
//  Created by Ilya Kalibrov on 9/17/21.
//

import UIKit

class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UINavigationBar.appearance().prefersLargeTitles = true
        
        tabBar.tintColor = .purple
        
        setupViewController()
    }
    
    func setupViewController() {
        viewControllers = [
            generateNavController(for: PocastsSearchController(), title: "Search", imageName: "search"),
            generateNavController(for: ViewController(), title: "Favorites", imageName: "favorites"),
            generateNavController(for: ViewController(), title: "Downloads", imageName: "downloads" )
        ]
    }
    
    fileprivate func generateNavController
    (
        for rootController: UIViewController,
        title: String,
        imageName: String
    ) -> UIViewController {
        let controller = UINavigationController(rootViewController: rootController)

        rootController.title = title
        
        controller.tabBarItem.title = title
        controller.tabBarItem.image = UIImage(named: imageName)
        
        return controller
    }
}

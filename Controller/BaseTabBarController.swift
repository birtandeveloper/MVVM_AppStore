//
//  BaseNavigatorViewController.swift
//  New Project
//
//  Created by Mac Os X on 21.12.2022.
//

import UIKit

let aiv = UIActivityIndicatorView(color: .white, style: .large)

class BaseTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = [
            createNavController(viewController: TopFreeAppsVC(), title: Constants.Text.freeAppsText, image: Constants.Text.freeAppsImageText),
            createNavController(viewController: TopPaidAppsVC(), title: Constants.Text.paidAppSText, image: Constants.Text.paidAppsImageText),
            createNavController(viewController: SearchScreenVC(), title: Constants.Text.searchAppsText, image: Constants.Text.searchImageText)
        ]
        
     
    }
    
    fileprivate func createNavController(viewController: UIViewController, title: String, image: String) -> UIViewController {
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = UIImage(systemName: image)
        navController.navigationBar.prefersLargeTitles = true
        return navController
    }
}

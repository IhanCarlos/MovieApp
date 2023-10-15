//
//  TabBarController.swift
//  MovieApp
//
//  Created by ihan carlos on 14/10/23.
//

import Foundation
import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.backgroundColor = .ds(.purpleDark)
        
        navigationController?.setNavigationBarHidden(true, animated: false)

        let viewController1 = HomeViewController()
        viewController1.tabBarItem = UITabBarItem(title: "Movies", image: UIImage(systemName: "film.fill"), tag: 0)

        let viewController2 = SeriesViewController()
        viewController2.tabBarItem = UITabBarItem(title: "Series", image: UIImage(systemName: "appletvremote.gen2"), tag: 1)
        
        let viewController3 = FavoritesViewController()
        viewController3.tabBarItem = UITabBarItem(title: "Favorites", image: UIImage(systemName: "suit.heart.fill"), tag: 2)

        viewControllers = [viewController1, viewController2, viewController3]
        
        selectedIndex = 0
        customizeTabBar()
    }
}

extension UITabBarController {
    func customizeTabBar() {

        let unselectedColor = UIColor.ds(.redDark)
        UITabBarItem.appearance().setTitleTextAttributes([.foregroundColor: unselectedColor], for: .normal)
        
        let selectedColor = UIColor.ds(.orange)
        UITabBarItem.appearance().setTitleTextAttributes([.foregroundColor: selectedColor], for: .selected)
        
        UITabBar.appearance().unselectedItemTintColor = unselectedColor
        
        UITabBar.appearance().tintColor = selectedColor
    }
}


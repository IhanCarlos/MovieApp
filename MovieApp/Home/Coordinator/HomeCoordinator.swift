//
//  HomeCoordinator.swift
//  MovieApp
//
//  Created by ihan carlos on 12/06/23.
//

import Foundation
import UIKit


class HomeCoordinator: Coordinator {
    
    var parentCoordinator: Coordinator?
    var children: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navCon : UINavigationController) {
        self.navigationController = navCon
    }
    
    func start() {
        HomeCoordinator()
    }
    
    func HomeCoordinator() {
        let vc: HomeViewController = HomeViewController()
        navigationController.pushViewController(vc, animated: true)
    }
}

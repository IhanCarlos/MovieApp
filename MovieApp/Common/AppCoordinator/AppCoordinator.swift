//
//  AppCoordinator.swift
//  MovieApp
//
//  Created by ihan carlos on 11/06/23.
//

import UIKit

protocol Coordinator {
    var parentCoordinator: Coordinator? { get set }
    var children: [Coordinator] { get set }
    var navigationController : UINavigationController { get set }
}

class AppCoordinator: Coordinator {
    
    var parentCoordinator: Coordinator?
    var children: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navCon : UINavigationController) {
        self.navigationController = navCon
    }
    
    func start() {
        goToLoginPage()
        navigationController.isNavigationBarHidden = true
    }
    
    func goToLoginPage(){
        let generalCoordinator = GeneralCoordinator(
            navCon: navigationController,
            delegate: self
        )
        generalCoordinator.start()
    }
}

extension AppCoordinator: GeneralCoordinatorDelegate { }

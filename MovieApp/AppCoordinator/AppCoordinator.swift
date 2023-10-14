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
        let loginCoordinator = LoginCoordinator(
            navCon: navigationController,
            delegate: self
        )
        loginCoordinator.start()
    }
    
    func goToRegisterPage(){
        let registerCoordinator = RegisterCoordinator(
            navCon: navigationController,
            delegate: self
        )
        registerCoordinator.start()
    }
    
    func goToHomePage(){
        let homeCoordinator = HomeCoordinator(
            navCon: navigationController
        )
        homeCoordinator.start()
    }
}

extension AppCoordinator: LoginCoordinatorDelegate {
    func goToHome() {
        goToHomePage()
    }
    
    func goToRegister() {
        goToRegisterPage()
    }
}

extension AppCoordinator: RegisterCoordinatorDelegate {
    func goToLogin() {
        goToLoginPage()
    }
    
}

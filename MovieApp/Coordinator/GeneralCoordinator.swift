//
//  LoginCoordinator.swift
//  MovieApp
//
//  Created by ihan carlos on 11/06/23.
//

import Foundation
import UIKit

protocol GeneralCoordinatorDelegate { }

class GeneralCoordinator: Coordinator {
    
    var parentCoordinator: Coordinator?
    var children: [Coordinator] = []
    var navigationController: UINavigationController
    var delegate: GeneralCoordinatorDelegate?
    
    init(navCon : UINavigationController, delegate: GeneralCoordinatorDelegate) {
        self.navigationController = navCon
        self.delegate = delegate
    }
    
    func start() {
        loginCoordinatorScreen()
    }
    
    func popScreen() {
        navigationController.popViewController(animated: true)
    }
    
    func loginCoordinatorScreen() {
        let viewModel = LoginViewModel(delegate: self)
        let vc: LoginViewController = LoginViewController(viewModel: viewModel)
        navigationController.pushViewController(vc, animated: true)
    }
    
    func goToRegisterScreen() {
        let viewModel = RegisterViewModel(delegate: self)
        let vc: RegisterViewController = RegisterViewController(viewModel: viewModel)
        navigationController.pushViewController(vc, animated: true)
    }
    
    func tabBarScreen() {
        let vc: TabBarController = TabBarController()
        navigationController.pushViewController(vc, animated: true)
    }
}

extension GeneralCoordinator: LoginViewModelCoordinatorDelegate {
    func goToRegister() {
        goToRegisterScreen()
    }
    
    func goToHome() {
        tabBarScreen()
    }
}

extension GeneralCoordinator: RegisterViewModelCoordinatorDelegate {
    func popToLogin() {
        popScreen()
    }
}

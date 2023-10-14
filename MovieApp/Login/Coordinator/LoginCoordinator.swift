//
//  LoginCoordinator.swift
//  MovieApp
//
//  Created by ihan carlos on 11/06/23.
//

import Foundation
import UIKit

protocol LoginCoordinatorDelegate {
    func goToHome()
    func goToRegister()
}

class LoginCoordinator: Coordinator {
    
    var parentCoordinator: Coordinator?
    var children: [Coordinator] = []
    var navigationController: UINavigationController
    var delegate: LoginCoordinatorDelegate?
    
    init(navCon : UINavigationController, delegate: LoginCoordinatorDelegate) {
        self.navigationController = navCon
        self.delegate = delegate
    }
    
    func start() {
        loginCoordinator()
    }
    
    func loginCoordinator() {
        let viewModel = LoginViewModel(delegate: self)
        let vc: LoginViewController = LoginViewController(viewModel: viewModel)
        navigationController.pushViewController(vc, animated: true)
    }
    
    func goToRegister() {
        let viewModel = RegisterViewModel(delegate: self)
        let vc: RegisterViewController = RegisterViewController(viewModel: viewModel)
        navigationController.pushViewController(vc, animated: true)
    }
}

extension LoginCoordinator: LoginViewModelCoordinatorDelegate {
    func goToHome() {
        delegate?.goToHome()
    }
}

extension LoginCoordinator: RegisterViewModelCoordinatorDelegate {
    func goToLogin() {
        loginCoordinator()
    }
}

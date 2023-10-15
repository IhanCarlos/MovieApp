//
//  LoginViewController.swift
//  MovieApp
//
//  Created by ihan carlos on 06/06/23.
//

import UIKit

protocol LoginViewModelCoordinatorDelegate {
    func goToHome()
    func goToRegister()
}

class LoginViewModel: LoginViewModelCoordinatorDelegate {
    
    
    private var delegate: LoginViewModelCoordinatorDelegate?
    
    init(delegate: LoginViewModelCoordinatorDelegate) {
        self.delegate = delegate
    }
    
    func goToHome() {
        delegate?.goToHome()
    }
    
    func goToRegister() {
        delegate?.goToRegister()
    }
}




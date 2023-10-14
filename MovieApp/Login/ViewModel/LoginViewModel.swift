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

protocol LoginViewModelProtocols {
    func validTextField(email: String, password: String) -> Bool
}

class LoginViewModel: LoginViewModelProtocols, LoginViewModelCoordinatorDelegate {
    
    
    private var delegate: LoginViewModelCoordinatorDelegate?
    
    init(delegate: LoginViewModelCoordinatorDelegate) {
        self.delegate = delegate
    }
    
    func validTextField(email: String, password: String) -> Bool {
        
        if !email.isEmpty && !password.isEmpty {
            return true
        } else {
            return false
        }
    }
    
    func goToHome() {
        delegate?.goToHome()
    }
    
    func goToRegister() {
        delegate?.goToRegister()
    }
}




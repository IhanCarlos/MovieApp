//
//  RegisterViewController.swift
//  MovieApp
//
//  Created by ihan carlos on 03/06/23.
//

import UIKit

class RegisterViewController: UIViewController {
    
    var registerScreen: RegisterScreen?
    
    override func loadView() {
    registerScreen = RegisterScreen()
        view = registerScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        registerScreen?.delegate(delegate: self)
        view.backgroundColor = .orange
    }
}

extension RegisterViewController: RegisterScreenProtocol {
    func actionRegisterButton() {
        print("Register button")
    }
    
    func actionBackButton() {
        navigationController?.popViewController(animated: true)
    }
    
    
}

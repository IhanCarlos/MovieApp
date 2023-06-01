//
//  LoginViewController.swift
//  MovieApp
//
//  Created by ihan carlos on 31/05/23.
//

import UIKit

class LoginViewController: UIViewController {
    
    var loginScreen: LoginScreen?
    
    override func loadView() {
        loginScreen = LoginScreen()
        view = loginScreen
        view.backgroundColor = .red
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

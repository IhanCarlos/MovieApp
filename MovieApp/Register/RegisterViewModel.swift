//
//  RegisterViewModel.swift
//  MovieApp
//
//  Created by ihan carlos on 12/06/23.
//

import Foundation
import UIKit

protocol RegisterViewModelCoordinatorDelegate {
    func popToLogin()
}

class RegisterViewModel: RegisterViewModelCoordinatorDelegate {
    
    var delegate: RegisterViewModelCoordinatorDelegate?
    
    init(delegate: RegisterViewModelCoordinatorDelegate) {
        self.delegate = delegate
    }
    
    func popToLogin() {
        delegate?.popToLogin()
    }
}

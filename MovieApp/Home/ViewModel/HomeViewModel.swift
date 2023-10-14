//
//  HomeViewModel.swift
//  MovieApp
//
//  Created by ihan carlos on 12/06/23.
//

import Foundation

protocol HomeViewModelCoordinatorDelegate {
    func goToHome()
}

class HomeViewModel:HomeViewModelCoordinatorDelegate {
    
    private var delegate : HomeViewModelCoordinatorDelegate?
    
    init(delegate: HomeViewModelCoordinatorDelegate) {
        self.delegate = delegate
    }
    
    func goToHome() {
        delegate?.goToHome()
    }
}

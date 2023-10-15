//
//  FavoritesViewModel.swift
//  MovieApp
//
//  Created by ihan carlos on 14/10/23.
//

import Foundation

protocol FavoritesViewModelCoordinatorDelegate {
}

class FavoritesViewModel: FavoritesViewModelCoordinatorDelegate {
    
    private var delegate: FavoritesViewModelCoordinatorDelegate?
    
    init(delegate: FavoritesViewModelCoordinatorDelegate) {
        self.delegate = delegate
    }
}

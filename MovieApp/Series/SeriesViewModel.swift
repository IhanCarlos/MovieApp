//
//  SeriesViewModel.swift
//  MovieApp
//
//  Created by ihan carlos on 14/10/23.
//

import Foundation

protocol SeriesViewModelCoordinatorDelegate {
}

class SeriesViewModel: SeriesViewModelCoordinatorDelegate {
    
    private var delegate: SeriesViewModelCoordinatorDelegate?
    
    init(delegate: SeriesViewModelCoordinatorDelegate) {
        self.delegate = delegate
    }
}

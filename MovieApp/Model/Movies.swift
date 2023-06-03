//
//  Movies.swift
//  MovieApp
//
//  Created by ihan carlos on 29/05/23.
//

import Alamofire
import UIKit

struct Movie {
    let title: String
    let imageURL: String
    let description: String
    
}

enum CellType {
    case SuccessfulMovies
    case Movies
}


//
//  Movies.swift
//  MovieApp
//
//  Created by ihan carlos on 29/05/23.
//

import Alamofire
import UIKit

struct MoviesResponse: Codable {
    let results: [Movie]
}

struct Movie: Codable {
    let title: String
    let posterPath: String
}



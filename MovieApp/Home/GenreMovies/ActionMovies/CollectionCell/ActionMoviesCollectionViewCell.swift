//
//  ActionMoviesCollectionViewCell.swift
//  MovieApp
//
//  Created by ihan carlos on 05/06/23.
//

import UIKit
import Alamofire

class ActionMoviesCollectionViewCell: UICollectionViewCell {
    
    static let identifier:String = "ActionMoviesCollectionViewCell"
    let actionMoviesScreen:ActionMoviesScreen = ActionMoviesScreen()
    let apiKey = "04e551e58f99661e65616e865bdb40dc"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubView()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubView() {
        actionMoviesScreen.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(actionMoviesScreen)
    }
    
    func configConstraints() {
        actionMoviesScreen.pin(to: self)
    }
    
    func configure(with movie: Movie) {
        actionMoviesScreen.loadImage(from: movie.posterPath) { image in
            DispatchQueue.main.async {
                self.actionMoviesScreen.imageMovies.image = image
            }
        }
    }
}

extension ActionMoviesCollectionViewCell {
    
    func fetchActionMovies(completion: @escaping ([Movie]) -> Void) {
        let url = "https://api.themoviedb.org/3/discover/movie"
        
        let parameters: [String: Any] = [
            "api_key": apiKey,
            "with_genres": "28" // ID de gênero para filmes de ação
        ]
        
        AF.request(url, parameters: parameters).responseJSON { response in
            if let data = response.data {
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let moviesResponse = try decoder.decode(MoviesResponse.self, from: data)
                    let movies = moviesResponse.results
                    completion(movies)
                } catch {
                    print("Error decoding JSON: \(error)")
                    completion([])
                }
            } else {
                completion([])
            }
        }
    }
    
    func loadImage(from posterPath: String, completion: @escaping (UIImage?) -> Void) {
        let imageUrl = "https://image.tmdb.org/t/p/w500\(posterPath)"
        
        AF.download(imageUrl).responseData { response in
            if let data = response.value, let image = UIImage(data: data) {
                completion(image)
            } else {
                completion(nil)
            }
        }
    }
    
}

//
//  ViewController.swift
//  MovieApp
//
//  Created by ihan carlos on 29/05/23.
//

import UIKit
import Alamofire

class HomeViewController: UIViewController {
    
    var homeScreen: HomeScreen?
    var movies: [Movie] = []
    
    override func loadView() {
        homeScreen = HomeScreen()
        view = homeScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        homeScreen?.configTableViewProtocols(delegate: self, dataSource: self)
        fetchMovies()
    }
    
    private func fetchMovies() {
        let apiKey = "04e551e58f99661e65616e865bdb40dc" // Substitua pela sua chave de API do TMDB
        
        let url = "https://api.themoviedb.org/3/discover/movie"
        let parameters: Parameters = [
            "api_key": apiKey,
            "sort_by": "vote_average.desc"
        ]
        
        AF.request(url, method: .get, parameters: parameters).responseJSON { response in
            switch response.result {
            case .success(let value):
                if let moviesData = value as? [String: Any], let results = moviesData["results"] as? [[String: Any]] {
                    self.movies = results.compactMap { movieData -> Movie? in
                        if let title = movieData["title"] as? String,
                           let imageURL = movieData["poster_path"] as? String,
                           let description = movieData["overview"] as? String {
                            let movie = Movie(title: title, imageURL: "https://image.tmdb.org/t/p/w500\(imageURL)", description: description)
                            return movie
                        }
                        return nil
                    }
                    self.homeScreen?.tableView.reloadData()
                }
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
}

extension HomeViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:MovieTableViewCell? = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.identifier, for: indexPath) as? MovieTableViewCell
        cell?.configure(with: movies[indexPath.row])

        return cell ?? UITableViewCell()
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}


//
//  MovieTableViewCell.swift
//  MovieApp
//
//  Created by ihan carlos on 30/05/23.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    static let identifier: String = "MovieTableViewCell"
    
    lazy var movies: MovieTableViewCellScreen = {
        let view = MovieTableViewCellScreen()
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addElements()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addElements() {
        self.contentView.addSubview(self.movies)
    }
    
    func configure(with movie: Movie) {
       //  Atualiza as subviews com os dados do filme
        if let imageURL = URL(string: "https://image.tmdb.org/t/p/w500\(movie.imageURL)") {
            URLSession.shared.dataTask(with: imageURL) { (data, _, _) in
                if let data = data, let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.movies.movieImageView.image = image
                    }
                }
            }.resume()
        }
        movies.titleLabel.text = movie.title
        movies.descriptionLabel.text = movie.description
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            movies.topAnchor.constraint(equalTo: topAnchor),
            movies.leadingAnchor.constraint(equalTo: leadingAnchor),
            movies.trailingAnchor.constraint(equalTo: trailingAnchor),
            movies.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
}

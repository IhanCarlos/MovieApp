//
//  ActionMoveisScreen.swift
//  MovieApp
//
//  Created by ihan carlos on 05/06/23.
//

import UIKit
import Alamofire

class ActionMoviesScreen: UIView {
    
    lazy var imageMovies: UIImageView = {
        let img = UIImageView()
        img.clipsToBounds = true
        img.layer.cornerRadius = 8
        img.backgroundColor = .orange
        return img
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addElements()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addElements() {
        addSubview(imageMovies)
    }
    
    func configConstraints() {
        imageMovies.cardImageConstraints(image: self)
    }
    
    func configure(with movie: Movie) {
            loadImage(from: movie.posterPath) { [weak self] image in
                DispatchQueue.main.async {
                    self?.imageMovies.image = image
                }
            }
        }
    func loadImage(from path: String, completion: @escaping (UIImage?) -> Void) {
            let imageUrl = "https://image.tmdb.org/t/p/w500\(path)"
            
            AF.download(imageUrl).responseData { response in
                if let data = response.value, let image = UIImage(data: data) {
                    completion(image)
                } else {
                    completion(nil)
                }
            }
        }
    }


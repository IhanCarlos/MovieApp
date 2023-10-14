//
//  ActionMoviesCollectionViewCell.swift
//  MovieApp
//
//  Created by ihan carlos on 05/06/23.
//

import UIKit
import Alamofire

class ActionMoviesCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "ActionMoviesCollectionViewCell"
    
    lazy var imageMovies: UIImageView = {
        let img = UIImageView()
        img.clipsToBounds = true
        img.layer.cornerRadius = 8
        img.backgroundColor = .orange
        return img
    }()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension ActionMoviesCollectionViewCell: ViewCodeType {
    func buildViewHierarchy() {
        addSubview(imageMovies)
    }
    
    func setupConstraints() {
        imageMovies.cardImageConstraints(image: self)
    }
}

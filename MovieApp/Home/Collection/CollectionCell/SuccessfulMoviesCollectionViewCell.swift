//
//  SuccessfulMoviesCollectionViewCell.swift
//  MovieApp
//
//  Created by ihan carlos on 01/06/23.
//

import UIKit

class SuccessfulMoviesCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "SuccessfulMoviesCollectionViewCell"
    
    let successfulMovies: SuccessfulMovies = SuccessfulMovies()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubView()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setUpCell(data: CardsMovies) {
        successfulMovies.image.image = UIImage(named: data.image)
        successfulMovies.titleLabel.text = data.title
        successfulMovies.descriptionLabel.text = data.description
    }
    private func addSubView() {
        successfulMovies.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(successfulMovies)
    }
    
    func configConstraints() {
        NSLayoutConstraint.activate([
            successfulMovies.topAnchor.constraint(equalTo: topAnchor),
            successfulMovies.leftAnchor.constraint(equalTo: leftAnchor),
            successfulMovies.rightAnchor.constraint(equalTo: rightAnchor),
            successfulMovies.bottomAnchor.constraint(equalTo: bottomAnchor)
            
        ])
    }
    
    
}

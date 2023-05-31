//
//  MovieTableViewCellScreen.swift
//  MovieApp
//
//  Created by ihan carlos on 30/05/23.
//

import UIKit

class MovieTableViewCellScreen: UIView {
    
    lazy var movieImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.tintColor = .red
        image.backgroundColor = .lightGray
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.layer.cornerRadius = 10
        return image
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .black
        label.backgroundColor = .lightGray
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .lightGray
        label.backgroundColor = .lightGray
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(movieImageView)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            movieImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            movieImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            movieImageView.heightAnchor.constraint(equalToConstant: 160),
            movieImageView.widthAnchor.constraint(equalToConstant: 160),
            
            titleLabel.leadingAnchor.constraint(equalTo: movieImageView.trailingAnchor, constant: 20),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            descriptionLabel.leadingAnchor.constraint(equalTo: movieImageView.trailingAnchor, constant: 15)
            
        ])
    }
}

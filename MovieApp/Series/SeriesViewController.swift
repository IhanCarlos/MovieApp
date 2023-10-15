//
//  SeriesViewController.swift
//  MovieApp
//
//  Created by ihan carlos on 14/10/23.
//

import UIKit

class SeriesViewController: UIViewController {
    
    var viewModel: SeriesViewModel!
    
    lazy var backgorundImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "backgroundHome")
        return image
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

extension SeriesViewController: ViewCodeType {
    func buildViewHierarchy() {
        view.addSubview(backgorundImage)
    }
    
    func setupConstraints() {
        backgorundImage.anchor(
            top: view.topAnchor,
            left: view.leftAnchor,
            bottom: view.bottomAnchor,
            right: view.rightAnchor
        )
    }
}

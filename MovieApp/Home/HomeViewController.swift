//
//  ViewController.swift
//  MovieApp
//
//  Created by ihan carlos on 29/05/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    var viewModel: HomeViewModel!
    var data: [TesteModel] = [
        TesteModel(image: UIImage(systemName: "brain"),title: "Filme 1"),
        TesteModel(image: UIImage(systemName: "brain"),title: "Filme 2"),
        TesteModel(image: UIImage(systemName: "brain"),title: "Filme 3"),
        TesteModel(image: UIImage(systemName: "brain"),title: "Filme 4"),
        TesteModel(image: UIImage(systemName: "brain"),title: "Filme 5"),
        TesteModel(image: UIImage(systemName: "brain"),title: "Filme 6"),
    ]
    
    lazy var backgorundImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "backgroundHome")
        return image
    }()
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var collectionView:UICollectionView = {
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout.init())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
        collectionView.delaysContentTouches = false
        collectionView.register(RecomendationsCollectionViewCell.self, forCellWithReuseIdentifier: RecomendationsCollectionViewCell.identifier)
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .horizontal
        collectionView.setCollectionViewLayout(layout, animated: false)
        
        return collectionView
    }()
    
    override func viewDidLoad() {
        setupView()
        navigationController?.setNavigationBarHidden(true, animated: false)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension HomeViewController: ViewCodeType {
    func buildViewHierarchy() {
        view.addSubview(backgorundImage)
        view.addSubview(containerView)
        containerView.addSubview(collectionView)
    }
    
    func setupConstraints() {
        backgorundImage.anchor(
            top: view.topAnchor,
            left: view.leftAnchor,
            bottom: view.bottomAnchor,
            right: view.rightAnchor
        )
        
        containerView.anchor(
            top: view.safeAreaLayoutGuide.topAnchor,
            left: view.leftAnchor,
            bottom: view.safeAreaLayoutGuide.bottomAnchor,
            right: view.rightAnchor
        )
        
        collectionView.anchor(
            top: containerView.topAnchor,
            left: containerView.leftAnchor,
            right: containerView.rightAnchor,
            topConstant: 20,
            heightConstant: 170
        )
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecomendationsCollectionViewCell.identifier, for: indexPath) as! RecomendationsCollectionViewCell
        cell.setUpCell(data: self.data[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 150)
    }
}

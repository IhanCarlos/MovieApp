//
//  ActionMoviesCollectionView.swift
//  MovieApp
//
//  Created by ihan carlos on 05/06/23.
//

import UIKit

class ActionMoviesCollectionView: UIView {
    lazy var collectionView: UICollectionView = {
           let layout = UICollectionViewFlowLayout()
           layout.scrollDirection = .horizontal
           
           let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
           cv.translatesAutoresizingMaskIntoConstraints = false
           cv.showsVerticalScrollIndicator = false
           cv.backgroundColor = .red
           cv.delaysContentTouches = false
           cv.register(ActionMoviesCollectionViewCell.self, forCellWithReuseIdentifier: ActionMoviesCollectionViewCell.identifier)
           
           return cv
       }()
    
    public func delegateCollectionView(delegate:UICollectionViewDelegate,dataSourse:UICollectionViewDataSource) {
        self.collectionView.delegate = delegate
        self.collectionView.dataSource = dataSourse
    }
    
    public func reloadCollectionView() {
        self.collectionView.reloadData()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addElements()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements() {
        addSubview(collectionView)
    }
    
    private func setUpConstraints() {
        collectionView.pin(to: self)
    }
}


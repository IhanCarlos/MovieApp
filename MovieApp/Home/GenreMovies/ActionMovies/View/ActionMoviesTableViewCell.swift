//
//  ActionMoviesTableViewCell.swift
//  MovieApp
//
//  Created by ihan carlos on 05/06/23.
//

import UIKit

class ActionMoviesTableViewCell: UITableViewCell {
    
    static let identifier: String = "ActionMoviesTableViewCell"
    
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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ActionMoviesTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ActionMoviesCollectionViewCell.identifier, for: indexPath) as? ActionMoviesCollectionViewCell else {
            return UICollectionViewCell()
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 190)
    }
}

extension ActionMoviesTableViewCell: ViewCodeType {
    func buildViewHierarchy() {
        addSubview(collectionView)
    }
    
    func setupConstraints() {
        collectionView.pin(to: self)
    }
}

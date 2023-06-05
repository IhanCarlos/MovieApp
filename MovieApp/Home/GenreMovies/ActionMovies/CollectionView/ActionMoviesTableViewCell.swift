//
//  ActionMoviesTableViewCell.swift
//  MovieApp
//
//  Created by ihan carlos on 05/06/23.
//

import UIKit

class ActionMoviesTableViewCell: UITableViewCell {
    
    let actionMoviesCollectionView: ActionMoviesCollectionView
    var data: [Movie] = [] {
        didSet {
            actionMoviesCollectionView.reloadCollectionView()
        }
    }
//    var actionMoviesScreen:ActionMoviesCollectionView = ActionMoviesCollectionView()
    
    static let identifier:String = "ActionMoviesTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
           actionMoviesCollectionView = ActionMoviesCollectionView(frame: .zero)
           super.init(style: style, reuseIdentifier: reuseIdentifier)
           addSubView()
           configConstraints()
           actionMoviesCollectionView.delegateCollectionView(delegate: self, dataSourse: self)
       }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubView() {
        actionMoviesCollectionView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(actionMoviesCollectionView)
    }
    func configConstraints(){
        actionMoviesCollectionView.pin(to: self)
    }
}
extension ActionMoviesTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ActionMoviesCollectionViewCell.identifier, for: indexPath) as! ActionMoviesCollectionViewCell
        
        let movie = data[indexPath.item]
        
        cell.actionMoviesScreen.loadImage(from: movie.posterPath) { image in
            DispatchQueue.main.async {
                cell.actionMoviesScreen.imageMovies.image = image
            }
        }
        
        return cell
        
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 190)
    }
}

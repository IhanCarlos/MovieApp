//
//  SuccessfulTableViewCell.swift
//  MovieApp
//
//  Created by ihan carlos on 01/06/23.
//

import UIKit

class SuccessfulTableViewCell: UITableViewCell {
    
    static let identifier: String = "SuccessfulTableViewCell"
    var successfulMovies: CollectionView = CollectionView()
    weak var parentViewController: UIViewController?
    var data: [CardsMovies] = [
        CardsMovies(title: "Ação", image: "action" , description: "a"),
        CardsMovies(title: "Comédia", image: "comedy", description: "b"),
        CardsMovies(title: "Drama", image: "thriller", description: "c"),
        CardsMovies(title: "Terror", image: "horror", description: "d"),
        CardsMovies(title: "Romance", image: "romance", description: "e"),
        CardsMovies(title: "Desenho", image: "design", description: "f"),
    ]
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        successfulMovies.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(successfulMovies)
        successfulMovies.configProtocolsCollectionView(delegate: self, dataSource: self)
        setUpContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpContraints() {
        NSLayoutConstraint.activate([
            successfulMovies.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            successfulMovies.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor),
            successfulMovies.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor),
            successfulMovies.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
            
        ])
    }
    public func dataCollection(data:[CardsMovies]) {
        self.data = data
    }
}

extension SuccessfulTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:SuccessfulMoviesCollectionViewCell? = collectionView.dequeueReusableCell(withReuseIdentifier: SuccessfulMoviesCollectionViewCell.identifier, for: indexPath) as? SuccessfulMoviesCollectionViewCell
        cell?.setUpCell(data: self.data[indexPath.row])
        
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300, height: 190)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        navigateToViewController(at: indexPath)
        print(indexPath)
    }
    
    func navigateToViewController(at indexPath: IndexPath) {
           guard let parentViewController = parentViewController else {
               return
           }
           
           let viewController: UIViewController
           
           switch indexPath.row {
           case 0:
               viewController = ActionMoviesViewController()
               print("index 0 selecionado")
               // Configurar o viewController com os dados relevantes da primeira célula

           default:
               return
           }
           
           parentViewController.navigationController?.pushViewController(viewController, animated: true)
       }
   }


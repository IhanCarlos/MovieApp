//
//  ViewController.swift
//  MovieApp
//
//  Created by ihan carlos on 29/05/23.
//

import UIKit
import Alamofire

class HomeViewController: UIViewController {
    
    var homeScreen: HomeScreen?
    var movies: [Movie] = []
    
    override func loadView() {
        homeScreen = HomeScreen()
        view = homeScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeScreen?.configTableViewProtocols(delegate: self, dataSource: self)
    }
}

extension HomeViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:ActionMoviesTableViewCell? = tableView.dequeueReusableCell(withIdentifier: ActionMoviesTableViewCell.identifier, for: indexPath) as? ActionMoviesTableViewCell
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}


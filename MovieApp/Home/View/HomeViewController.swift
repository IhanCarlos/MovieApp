//
//  ViewController.swift
//  MovieApp
//
//  Created by ihan carlos on 29/05/23.
//

import UIKit
import Alamofire

class HomeViewController: UIViewController {
    
    lazy var tableView: UITableView = {
        let tb = UITableView()
        tb.translatesAutoresizingMaskIntoConstraints = false
        tb.backgroundColor = UIColor(named: "BackgroundColor")
        tb.register(ActionMoviesTableViewCell.self, forCellReuseIdentifier: ActionMoviesTableViewCell.identifier)
        return tb
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
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

extension HomeViewController: ViewCodeType {
    func buildViewHierarchy() {
        view.addSubview(tableView)
    }
    
    func setupConstraints() {
        tableView.pin(to: view)
    }
}




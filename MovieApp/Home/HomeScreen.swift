//
//  HomeScreen.swift
//  MovieApp
//
//  Created by ihan carlos on 29/05/23.
//

import UIKit

class HomeScreen: UIView {
    
    lazy var tableView: UITableView = {
        let tb = UITableView()
        tb.translatesAutoresizingMaskIntoConstraints = false
        tb.backgroundColor = UIColor(named: "BackgroundColor")
        tb.register(ActionMoviesTableViewCell.self, forCellReuseIdentifier: ActionMoviesTableViewCell.identifier)
        return tb
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addElements()
        setUpConstraints()
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configTableViewProtocols(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        tableView.delegate = delegate
        tableView.dataSource = dataSource
    }
    
    private func addElements() {
        addSubview(tableView)
    }
    
    private func setUpConstraints() {
        tableView.pin(to: self)
    }
}

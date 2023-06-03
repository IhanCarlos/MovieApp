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
        tb.register(SuccessfulTableViewCell.self, forCellReuseIdentifier: SuccessfulTableViewCell.identifier)
        tb.register(MovieTableViewCell.self, forCellReuseIdentifier: MovieTableViewCell.identifier)
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
        NSLayoutConstraint.activate([
            
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    var dataSource: UITableViewDataSource? {
        get {
            return tableView.dataSource
        }
        set {
            tableView.dataSource = newValue
        }
    }
    
    var delegate: UITableViewDelegate? {
        get {
            return tableView.delegate
        }
        set {
            tableView.delegate = newValue
        }
    }
    
    func reloadData() {
        tableView.reloadData()
    }
}

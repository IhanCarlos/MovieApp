//
//  HomeScreen.swift
//  MovieApp
//
//  Created by ihan carlos on 29/05/23.
//

import UIKit

protocol HomeScreenProtocol: AnyObject {
    func actionButtonOne()
    func actionButtonTwo()
}

class HomeScreen: UIView {
    
    lazy var tableView: UITableView = {
        let tb = UITableView()
        tb.translatesAutoresizingMaskIntoConstraints = false
        tb.backgroundColor = .white
        tb.register(MovieTableViewCell.self, forCellReuseIdentifier: MovieTableViewCell.identifier)
        return tb
    }()
    
    lazy var navigationBar: UINavigationBar = {
        let nav = UINavigationBar()
        nav.translatesAutoresizingMaskIntoConstraints = false
        nav.backgroundColor = .green
        return nav
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
        addSubview(navigationBar)
    }
    
    private func setupNavigationBar() {
        let navigationItem = UINavigationItem(title: "Movies")
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
        navigationItem.rightBarButtonItem = addButton
        
        let searchButton = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(searchButtonTapped))
        navigationItem.leftBarButtonItem = searchButton
        
        navigationBar.items = [navigationItem]
    }
    @objc private func addButtonTapped() {
        
    }
    
    @objc private func searchButtonTapped() {
        // Ação do botão de busca
        // Redirecione para a tela desejada
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: navigationBar.topAnchor),
            
            navigationBar.leadingAnchor.constraint(equalTo: leadingAnchor),
            navigationBar.trailingAnchor.constraint(equalTo: trailingAnchor),
            navigationBar.bottomAnchor.constraint(equalTo: bottomAnchor),
            navigationBar.heightAnchor.constraint(equalToConstant: 44),
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

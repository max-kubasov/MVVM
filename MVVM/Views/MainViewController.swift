//
//  ViewController.swift
//  MVVM
//
//  Created by Max on 25.05.2024.
//

import UIKit

class MainViewController: UIViewController {
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    let activityIndicator = UIActivityIndicatorView()
    
    var viewModel = MainViewModel()
    
    var cellDataSource = [Users]()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.getUsers()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Hello")
        setupView()
        setConstraint()
        bindViewModel()
        
    }
    
    private func setupView() {
        view.backgroundColor = .white
        title = "Main Screen"
        view.addSubview(tableView)
        setupTableView()
        
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(activityIndicator)
    }
    
    private func bindViewModel() {
        viewModel.isLoading.bind { [weak self] isLoading in
            guard let self, let isLoading else { return }
            DispatchQueue.main.async {
                isLoading ? self.activityIndicator.startAnimating() : self.activityIndicator.stopAnimating()
            }
        }
        
        viewModel.cellDataSource.bind { [weak self] users in
            guard let self, let users else { return }
            cellDataSource = users
            reloadTableView()
        }
    }
    
    
}

extension MainViewController {
    
    private func setConstraint() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            
        ])
    }
}


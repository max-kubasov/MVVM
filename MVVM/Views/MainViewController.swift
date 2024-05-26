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
        tableView.backgroundColor = .darkGray
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    var viewModel = MainViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Hello")
        setupView()
        setConstraint()
    }
    
    private func setupView() {
        view.backgroundColor = .white
        title = "Main Screen"
        view.addSubview(tableView)
        setupTableView()
    }
    
    
}

extension MainViewController {
    
    private func setConstraint() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            
        ])
    }
}


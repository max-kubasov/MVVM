//
//  MainCell.swift
//  MVVM
//
//  Created by Max on 27.05.2024.
//

import UIKit

class MainCell: UITableViewCell {
    
    private var nameLabel = UILabel()
    private var emailLabel = UILabel()
    private var labelStackView = UIStackView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupView() {
        nameLabel.font = .systemFont(ofSize: 16)
        emailLabel.font = .systemFont(ofSize: 14)
        labelStackView = UIStackView(arrangedSubviews: [nameLabel, emailLabel])
        
        labelStackView.axis = .vertical
        labelStackView.distribution = .fillEqually
        labelStackView.spacing = 4
        labelStackView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(labelStackView)
        
        NSLayoutConstraint.activate([
            labelStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            labelStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
        ])
    }
    
    
}

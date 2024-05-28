//
//  MainCellViewModel.swift
//  MVVM
//
//  Created by Max on 28.05.2024.
//

import Foundation

class MainCellViewModel {
    var name: String
    var email: String
    
    init(_ user: Users) {
        self.name = user.username
        self.email = user.email
    }
}

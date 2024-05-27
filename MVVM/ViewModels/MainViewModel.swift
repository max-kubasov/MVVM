//
//  MainViewModel.swift
//  MVVM
//
//  Created by Max on 25.05.2024.
//

import Foundation

class MainViewModel {
    
    var isLoading: Observable<Bool> = Observable(false)
    var dataSource: [Users]?
    
    func numberOfSection() -> Int {
        1
    }
    
    func numberOfRows(_ section: Int) -> Int {
        10
    }
    
    func getUsers() {
        isLoading.value = true
        
        NetworkDataFetch.shared.fetchUsers { [weak self] users, error in
            guard let self else { return }
            self.isLoading.value = false
            
            if error != nil {
                print("Notify user")
            } else if let users {
                self.dataSource = users
            }
        }
    }
}

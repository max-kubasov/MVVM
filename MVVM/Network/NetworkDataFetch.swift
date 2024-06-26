//
//  NetworkDataFetch.swift
//  MVVM
//
//  Created by Max on 26.05.2024.
//

import Foundation

class NetworkDataFetch {
    
    static var shared = NetworkDataFetch()
    
    init() {}
    
    func fetchUsers(response: @escaping ([Users]?, NetworkError?) -> Void) {
        NetworkRequest.shared.getData { result in
            switch result {
            case .success(let data):
                do {
                    let users = try JSONDecoder().decode([Users].self, from: data)
                    response(users, nil)
                } catch let jsonError {
                    print("Failed to decode JSON", jsonError)
                }
            case .failure(_):
                response(nil, .canNotParseData)
            }
        }
    }
}

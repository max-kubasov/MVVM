//
//  NetworkRequest.swift
//  MVVM
//
//  Created by Max on 26.05.2024.
//

import Foundation

class NetworkRequest {
    
    static let shared = NetworkRequest()
    
    private init() {}
    
    func getData(comletionHandler: @escaping (Result<Data, NetworkError>) -> Void) {
        URLSession.shared.request(.users) { data, _, error in
            if error != nil {
                comletionHandler(.failure(.urlError))
            } else {
                guard let data else { return }
                comletionHandler(.success(data))
            }
        }
    }
}

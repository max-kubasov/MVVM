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
        URLSession.shared.request(.users) { data, response, error in
            DispatchQueue.main.async {
                if error != nil {
                    comletionHandler(.failure(.urlError))
                }
                
                guard let data else {
                    print("No data received.")
                    comletionHandler(.failure(.unknownError))
                    return
                }
                
                if let httpResponse = response as? HTTPURLResponse {
                    print("HTTP Response status code: \(httpResponse.statusCode)")
                }
                
                comletionHandler(.success(data))
            }
        }
    }
}

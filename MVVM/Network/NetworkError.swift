//
//  NetworkError.swift
//  MVVM
//
//  Created by Max on 26.05.2024.
//

import Foundation

enum NetworkError: Error {
    case urlError
    case canNotParseData
    case unknownError
}

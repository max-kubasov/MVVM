//
//  Users.swift
//  MVVM
//
//  Created by Max on 26.05.2024.
//

import Foundation

struct Users: Codable {
    let name: String
    let username: String
    let email: String
    let address: Address
    let phone: String
}

// MARK: - Address
struct Address: Codable {
    let street: String
    let suite: String
    let city: String
    let zipcode: String
    let geo: Geo
}

// MARK: - Geo
struct Geo: Codable {
    let lat, lng: String
}
